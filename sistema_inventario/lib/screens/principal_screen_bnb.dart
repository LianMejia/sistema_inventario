import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sistema_inventario/screens/home_screen.dart';
import 'package:sistema_inventario/screens/perfil_screen.dart';

class PrincipalScreenBnb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegaconModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegaconModel>(context);
    return BottomNavigationBar(
      selectedItemColor: Colors.blueAccent,
      type: BottomNavigationBarType.fixed,
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      //Ocultar texto icono seleccionado
      showSelectedLabels: false,
      //Ocultar texto iconos no seleccionados
      showUnselectedLabels: false,
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegaconModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //Este physics impide que al deslizarse mueva la pantallla
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeScreen(),
        PerfilScreen(),
      ],
    );
  }
}

class _NavegaconModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController(initialPage: 0);
  int get paginaActual => _paginaActual;
  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 1),
        curve: Curves.easeInOutCubicEmphasized);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
