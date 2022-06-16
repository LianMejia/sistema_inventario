import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Inicio',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.yellow,
          )
        ],
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
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                width: size.width * 0.40,
                height: size.height * 0.24,
                child: Column(
                  children: [
                    const Text('Cangrejos'),
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
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                width: size.width * 0.40,
                height: size.height * 0.24,
                child: Column(
                  children: [
                    const Text('Pescados'),
                    const Text('\$10'),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
