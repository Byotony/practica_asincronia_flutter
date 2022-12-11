import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practica_asincronia_flutter/services/mockapi.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int rayotext = 0;
  double rayoancho = 0;
  int rayosegundos = 0;
  int rayo = 0;
  int carrotext = 0;
  double carroancho = 0;
  int carrosegundos = 0;
  int carro = 0;
  int humanotext = 0;
  double humanoancho = 0;
  int humanosegundos = 0;
  int humano = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica',
      home: Scaffold(
        backgroundColor: Color(0xfffdfd96),
        appBar: AppBar(
          title: const Text(
            "Anthony Javier Palacios Bello",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xffffda9e),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          humanoancho = 200;
                          humanosegundos = 10;
                        });
                        humano = await MockApi().getFisherPriceInteger();
                        setState(() {
                          humanotext = humano;
                          humanoancho = 0;
                          humanosegundos = 0;
                        });
                      },
                      backgroundColor: Colors.yellow,
                      child: const Icon(
                        Icons.directions_walk,
                        color: Colors.black,
                      )),
                  AnimatedContainer(
                    width: humanoancho,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.yellow),
                    duration: Duration(seconds: humanosegundos),
                  ),
                  Text(
                    humanotext.toInt().toString(),
                    style:
                        const TextStyle(color: Colors.yellow, fontSize: 25.0),
                  )
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          carroancho = 200;
                          carrosegundos = 3;
                        });
                        carro = await MockApi().getHyundaiInteger();
                        setState(() {
                          carrotext = carro;
                          carroancho = 0;
                          carrosegundos = 0;
                        });
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(
                        Icons.airport_shuttle,
                        color: Colors.black,
                      )),
                  AnimatedContainer(
                    width: carroancho,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.blue),
                    duration: Duration(seconds: carrosegundos),
                  ),
                  Text(
                    carrotext.toInt().toString(),
                    style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                  )
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        rayoancho = 200;
                        rayosegundos = 1;
                      });
                      rayo = await MockApi().getFerrariInteger();
                      setState(() {
                        rayotext = rayo;
                        rayoancho = 0;
                        rayosegundos = 0;
                      });
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(
                      Icons.flash_on,
                      color: Colors.black,
                    ),
                  ),
                  AnimatedContainer(
                    width: rayoancho,
                    height: 15,
                    decoration: const BoxDecoration(color: Colors.red),
                    duration: Duration(seconds: rayosegundos),
                  ),
                  Text(
                    rayotext.toInt().toString(),
                    style: const TextStyle(color: Colors.red, fontSize: 25.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
