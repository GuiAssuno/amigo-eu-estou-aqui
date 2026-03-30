import 'package:flutter/material.dart';



class ONGsPage extends StatelessWidget {
  const ONGsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ONGs'),
      ),
      body: Center(
        child: Text('Lista de ONGs'),
      ),
    );
  }
}