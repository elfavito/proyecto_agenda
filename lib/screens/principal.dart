import 'package:agenda/widgets/pantalla.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'AgenFaLe',
          style: TextStyle(
              fontFamily: 'Allura',
              color: Colors.white70,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: const Content(),
    );
  }
}
