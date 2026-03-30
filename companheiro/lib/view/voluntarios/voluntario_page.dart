import 'package:flutter/material.dart';

class VoluntarioPage extends StatelessWidget {
  const VoluntarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voluntários'),
      ),
      body: Center(
        child: Text('Lista de Voluntários'),
      ),
    );
  }
}