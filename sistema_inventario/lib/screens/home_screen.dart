import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context);
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
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  size: 28,
                ),
                title: const Text(
                  'Cerrar Sesion',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          title:
                              const Text('¿Esta seguro de cerrar la sesion?'),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      authServices.logOut();
                                      Navigator.pushReplacementNamed(
                                          context, '/');
                                    },
                                    child: const Text(
                                      'Salir',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancelar',
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            )
                          ],
                        );
                      });
                },
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
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
          /* const SizedBox(
            height: 20,
          ), */
          /* Row(
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
          ), */
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('productos').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot x = snapshot.data!.docs[index];
                    if (snapshot.data == null) {
                      return SizedBox();
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* Text(x['nombreProducto']) */
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Container(
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Image.network(
                                    x['imagenProducto'],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Column(
                                children: [
                                  Text(
                                    x['nombreProducto'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    '\$${x['costoVentaProducto']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      color: Colors.blueAccent,
                                      shape: const StadiumBorder(),
                                      child: const Text(
                                        'Agregar al carrito',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      minWidth: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                );
              } else {
                return SizedBox();
              }
            },
          )
          /* Row(
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
          ) */
        ],
      ),
    );
  }
}
