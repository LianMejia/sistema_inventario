import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContainerLogin());
  }
}

class ContainerLogin extends StatefulWidget {
  @override
  State<ContainerLogin> createState() => _ContainerLoginState();
}

class _ContainerLoginState extends State<ContainerLogin> {
  TextEditingController _emailController = TextEditingController();

  bool isButtonActive = false;

  TextEditingController _passwordController = TextEditingController();

  bool isButtonActive2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(() {
      final isButtonActive = _emailController.text.length >= 6;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    _passwordController.addListener(() {
      final isButtonActive2 = _passwordController.text.length >= 8;
      setState(() {
        this.isButtonActive2 = isButtonActive2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Iniciar Sesion',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 224, 224),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              controller: _emailController,
              maxLength: 30,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Correo Electrónico',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                  border: InputBorder.none,
                  counterText: ""),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 224, 224),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              controller: _passwordController,
              maxLength: 30,
              autocorrect: false,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                  border: InputBorder.none,
                  counterText: ""),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              if (isButtonActive && isButtonActive2) ...[
                MaterialButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text);
                      FirebaseAuth.instance
                          .authStateChanges()
                          .listen((User? user) async {
                        if (user == null) {
                          print('Error');
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'No esta registrado, por favor registrese')));
                        } else {
                          final logueado = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          final tokenResult =
                              await FirebaseAuth.instance.currentUser!;
                          final idToken = await tokenResult.getIdToken();
                          final token = idToken;
                          print(token);

                          await storage.write(key: 'token', value: token);

                          Navigator.pushReplacementNamed(context, 'home');
                        }
                      });
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'No esta registrado o su numero no forma parte de yiga5')));
                    }
                  },
                  child: const Text(
                    'Iniciar Sesion',
                    style: TextStyle(color: Colors.white),
                  ),
                  minWidth: double.infinity,
                  height: 50,
                  shape: const StadiumBorder(),
                  color: Theme.of(context).primaryColor,
                ),
              ] else ...[
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Iniciar Sesion',
                    style: TextStyle(color: Colors.white),
                  ),
                  minWidth: double.infinity,
                  height: 50,
                  shape: const StadiumBorder(),
                  color: const Color.fromARGB(255, 200, 199, 199),
                ),
              ]
            ],
          )
          /* MaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
            height: 40,
            color: Colors.blueAccent,
            shape: const StadiumBorder(),
            child: const Text(
              'Iniciar Sesion',
              style: TextStyle(color: Colors.white),
            ),
            minWidth: double.infinity,
          ), */
          /* TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'registerScreen');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '¿No tienes una cuenta? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Registrate aqui',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )) */
        ],
      )),
    );
  }
}
