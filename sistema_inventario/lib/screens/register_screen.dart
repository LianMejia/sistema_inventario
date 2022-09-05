import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
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

  TextEditingController _nombredController = TextEditingController();

  bool isButtonActive3 = false;

  TextEditingController _celularController = TextEditingController();

  bool isButtonActive4 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.addListener(() {
      final isButtonActive = _emailController.text.length >= 8;
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
    _nombredController.addListener(() {
      final isButtonActive3 = _nombredController.text.length >= 2;
      setState(() {
        this.isButtonActive3 = isButtonActive3;
      });
    });
    _celularController.addListener(() {
      final isButtonActive4 = _celularController.text.length >= 8;
      setState(() {
        this.isButtonActive4 = isButtonActive4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Registrarse',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 224, 224),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              controller: _nombredController,
              maxLength: 30,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: 'Nombres',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              controller: _celularController,
              maxLength: 10,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: 'Celular',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              controller: _emailController,
              maxLength: 30,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Correo Electrónico',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: InputBorder.none,
                  counterText: ""),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Column(
            children: [
              if (isButtonActive && isButtonActive2) ...[
                MaterialButton(
                  height: 44,
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('usuarios')
                        .where('email', isEqualTo: _emailController.text)
                        .get()
                        .then((value) async {
                      if (value.docs.isEmpty) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          FirebaseAuth.instance
                              .authStateChanges()
                              .listen((User? user) async {
                            if (user == null) {
                              print('User is currently signed out!');
                            } else {
                              print('Usuario Logueado!');
                              print(user.uid);
                              FirebaseFirestore.instance
                                  .collection("usuarios")
                                  .doc(user.uid)
                                  .set({
                                'uid': user.uid,
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'nombres': _nombredController.text,
                                'celular': _celularController.text,
                                'photo_user': ''
                              });
                              /* await user.sendEmailVerification(); */
                              Navigator.pushNamed(context, '/');
                            }
                          });
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'El correo electronico que ingreso ya se encuentra registrado')));
                      }
                    });
                  },
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: const StadiumBorder(),
                  minWidth: double.infinity,
                ),
              ] else ...[
                MaterialButton(
                  height: 44,
                  onPressed: () {},
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: const Color.fromARGB(255, 200, 199, 199),
                  shape: const StadiumBorder(),
                  minWidth: double.infinity,
                ),
              ]
            ],
          ),
          /* MaterialButton(
            onPressed: () {},
            height: 40,
            color: Colors.blue,
            shape: const StadiumBorder(),
            child: const Text(
              'Registrarse',
              style: TextStyle(color: Colors.white),
            ),
            minWidth: double.infinity,
          ), */
          TextButton(
              autofocus: false,
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                shape: MaterialStateProperty.all(StadiumBorder()),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '¿Ya tienes una cuenta? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Inicia seion',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
