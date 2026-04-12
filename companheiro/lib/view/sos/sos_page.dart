import 'package:flutter/material.dart';



class SosPage extends StatelessWidget {
  const SosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S . O . S'),
      ),
      body: Center(
        child: Text('Achados e perdidos'),
      ),
    );
  }
}