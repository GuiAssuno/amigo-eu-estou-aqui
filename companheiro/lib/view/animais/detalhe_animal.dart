import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class DetalheAnimal extends StatelessWidget {
  final String idAnimal;
  const DetalheAnimal({super.key, required this.idAnimal});

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView (
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.grey,
                child: Center(child: Text('Foto do animal')),
              ),
              SizedBox(height: 16),
              Text('Nome do animal', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Descrição do animal. '),
              SizedBox(height: 16),
              
              
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Adotar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






























































