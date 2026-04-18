import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class DetalheAnimal extends StatelessWidget {
  final String idAnimal;
  DetalheAnimal({super.key, required this.idAnimal});

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView (
        child: SafeArea(
            child: SliverAppBar(
              
            )  
          ),
      ),
    );
  }
}






























































