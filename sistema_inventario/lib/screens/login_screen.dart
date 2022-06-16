import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContainerLogin());
  }
}

class ContainerLogin extends StatelessWidget {
  const ContainerLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'principalScreen');
            },
            height: 40,
            color: Colors.blue,
            shape: const StadiumBorder(),
            child: const Text(
              'Iniciar Sesion',
              style: TextStyle(color: Colors.white),
            ),
            minWidth: double.infinity,
          ),
          TextButton(
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
              ))
        ],
      )),
    );
  }
}
