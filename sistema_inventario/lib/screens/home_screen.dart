import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          'Inicio',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'carrito');
              },
              icon: const Icon(
                Icons.shopping_cart_rounded,
                color: Colors.blueAccent,
              )),
        ],
      ),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100))),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  'Juan Perez',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
                title: const Text(
                  'Inicio',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.list_alt_rounded,
                  size: 28,
                ),
                title: const Text(
                  'Mis pedidos',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'misPedidos');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  size: 28,
                ),
                title: const Text(
                  'Mi cuenta',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      body: ContainerHomeScreen(),
    );
  }
}

class ContainerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Lista de Productos',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                height: 30,
                width: 100,
                child: const Center(child: Text('Cangrejos')),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                height: 30,
                width: 100,
                child: const Center(child: Text('Pescados')),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                height: 30,
                width: 100,
                child: const Center(child: Text('Calamares')),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(18))),
                width: size.width * 0.40,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18))),
                        width: double.infinity,
                        child: Image.asset('assets/cangrejos.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Cangrejos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text('\$5'),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blueAccent,
                      shape: const StadiumBorder(),
                      child: const Text(
                        'Agregar al carrito',
                        style: TextStyle(color: Colors.white),
                      ),
                      minWidth: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
