import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  const TelaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Center(
        child: Text('Informações sobre o aplicativo'),
      ),
    );
  }
}