import 'package:flutter/material.dart';
import 'package:myapp/formularios/form_cliente.dart';
import 'package:myapp/formularios/form_producto.dart';
import 'homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "/home": (context) => HomePage(),
        "/producto": (context) => Producto(),
        "/cliente": (context) => Cliente(),
      },
    );
  }
}