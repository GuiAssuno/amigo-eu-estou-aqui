import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '/view/login/esqueceu_senha.dart';
import '/view/login/cadastro.dart';
import '/view/home.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();


}


class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _cnpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _cnpfCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  bool _senhaOculta = true;
  bool _carregando = false;
  int _opcaoSelecionada = 0;

//final ctrl = GetIt.I.get<AuthProvider>();


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFE7DFD5),
      body: Padding(
        padding: EdgeInsets.all( 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
//            const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFF84A9AC),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(104, 64, 82, 83),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.volunteer_activism, color: Color(0xFFE7DFD5), size: 44),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 20),
                  
                  const Text(
                  'Companheiro',
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF204051),
                  ),
                  ),
                ],
              ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoSlidingSegmentedControl<int>(

                groupValue: _opcaoSelecionada,
                thumbColor: Color(0xFF84A9AC),
                backgroundColor: Color(0xFF3B6978),
                children: const {
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Pessoa',
                    style: TextStyle(
                      fontSize: 12,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Color(0XFF000000),
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFE7DFD5),
                    ),
                    ),
                  ),
                  
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text('ONGs',
                    style: TextStyle(
                      fontSize: 12,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Color(0XFF000000),
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFE7DFD5),
                    ),
                    ),
                  ),
                },
                onValueChanged: (int? value) {
                  setState(() {
                    _opcaoSelecionada = value!;
                  });
                },
              ),
            ],
          ),

            Column(
              children: [
                Visibility(
                  visible: _opcaoSelecionada == 1,
                  child: Column(
                    children: [
                      TextField(
                        controller: _cnpfController,
                        style: TextStyle(fontSize: 14),
                        
                        decoration: InputDecoration(
                          labelText: 'CNFP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                
                TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(height: 10),
                
                TextField(
                  controller: _passwordController,
                  style: TextStyle(fontSize: 14),

                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),

                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const TelaCadastrar()),
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(color: Color(0xFF204051)),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const TelaEsqueceuSenha()),
                        ),
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Color(0xFF204051)),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Home()),
          ),
          child: _carregando
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : const Text('Entrar', style: TextStyle(fontSize: 16)),
        ),
      ),
        ],
        ),
      ),
    );
  }
}

extension on Object? {
  Object? login(String trim, String text) {}
}

extension on BuildContext {
  T read<T>() => throw UnimplementedError();
}



class AuthProvider {
  String? get erro => null;
}

class TelaEsqueceuSenha extends StatelessWidget {
  const TelaEsqueceuSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
      ),
      body: const Center(
        child: Text('Tela de recuperação de senha'),
      ),
    );
  }
}