import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarritoCompras extends StatefulWidget {
  @override
  State<CarritoCompras> createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {
  int cantidad = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Productos seleccionados',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.red),
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18)),
                              width: double.infinity,
                              child: Image.asset('assets/cangrejos.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Cangrejo',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('$cantidad'),
                            Row(
                              children: [
                                IconButton(
                                    splashRadius: 16,
                                    onPressed: () {
                                      cantidad++;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 30,
                                    )),
                                IconButton(
                                    splashRadius: 16,
                                    onPressed: () {
                                      cantidad--;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 30,
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      minWidth: double.infinity,
                      child: const Text(
                        'Pagar Ahora',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blueAccent,
                      shape: StadiumBorder(),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
