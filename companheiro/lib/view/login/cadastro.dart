import 'package:flutter/material.dart';

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({super.key});

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}



class _TelaCadastrarState extends State<TelaCadastrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
      ),
      body: const Center(
        child: Text('Tela de cadastro'),
      ),
    );
  }
}