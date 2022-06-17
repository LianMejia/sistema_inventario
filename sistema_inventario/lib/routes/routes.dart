import 'package:flutter/cupertino.dart';
import 'package:sistema_inventario/screens/carrito_screen.dart';
import 'package:sistema_inventario/screens/home_screen.dart';
import 'package:sistema_inventario/screens/login_screen.dart';
import 'package:sistema_inventario/screens/pedidos_screen.dart';
import 'package:sistema_inventario/screens/principal_screen_bnb.dart';
import 'package:sistema_inventario/screens/register_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginScreen(),
    'registerScreen': (BuildContext context) => RegisterScreen(),
    'home': (BuildContext context) => HomeScreen(),
    'principalScreen': (BuildContext context) => PrincipalScreenBnb(),
    'misPedidos': (BuildContext context) => MisPedidos(),
    'carrito': (BuildContext context) => CarritoCompras(),
  };
}
