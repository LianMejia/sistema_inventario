import 'dart:ui';

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
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
            'Registrarse',
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
            onPressed: () {},
            height: 40,
            color: Colors.blue,
            shape: const StadiumBorder(),
            child: const Text(
              'Registrarse',
              style: TextStyle(color: Colors.white),
            ),
            minWidth: double.infinity,
          ),
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
