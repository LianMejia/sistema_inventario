import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_inventario/screens/home_screen.dart';
import 'package:sistema_inventario/screens/login_screen.dart';

import '../services/auth_services.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //Si no se tiene la data(token)construimos
            //este widget
            if (!snapshot.hasData) {
              return const SizedBox();
            }

            //Un widget primero debe construirse antes de
            //poder hacer una navegacion

            //Esta funcion se ejecutara tan pronto esta
            //pantala se construya

            //Si no tengo la data(token), es decir
            //si retorna un string vacio
            if (snapshot.data == '') {
              Future.microtask(() {
                /* Navigator.pushReplacementNamed(context, 'homeScreen'); */
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LoginScreen(),
                        transitionDuration: const Duration(seconds: 0)));
              });
              //Si se tiene la data(token) y retorna el token
            } else {
              Future.microtask(() {
                /* Navigator.pushReplacementNamed(context, 'homeScreen'); */
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomeScreen(),
                        transitionDuration: const Duration(seconds: 0)));
              });
            }

            return Container();
          }),
    );
  }
}
