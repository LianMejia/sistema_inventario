import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  final storage = FlutterSecureStorage();
  //Metodo para leer el token(si existe) del firebase storage
  Future<String> readToken() async {
    //Si no existe el token
    return await storage.read(key: 'token') ?? '';
  }

  Future logOut() async {
    //Debemos destruir el token al cerrar sesion
    await storage.delete(key: 'token');
  }
}
