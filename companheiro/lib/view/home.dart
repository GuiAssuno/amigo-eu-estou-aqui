import 'package:flutter/material.dart';

import '/view/ongs/ongs_page.dart';
import '/view/animais/animal_page.dart';
import '/view/voluntarios/voluntario_page.dart';
import '/view/sobre/sobre.dart';
import '/view/home.dart';
import '/view/login/tela_login.dart';
import '/view/voluntarios/profile_page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  final List<Widget> _telas = const [
     AnimalPage(),
     VoluntarioPage(),
     ONGsPage(),
  ];

void _confirmarLogout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Sair'),
        content: const Text('Deseja realmente sair do aplicativo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              //context.read<AuthProvider>().logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const TelaLogin()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.volunteer_activism, size: 22),
            const SizedBox(width: 8),
            //const Text('Companheiro'),
          ],
        ),

        actions: [          
          PopupMenuButton<String>(
            icon: Icon(Icons.account_circle, size: 22, color: const Color(0xFF2C2C2A)),
            onSelected: (v) {
              if (v == 'sobre') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TelaSobre()));
              } else if (v == 'sair') {
                _confirmarLogout();
              } else if (v == 'profile') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
              }
            },

            itemBuilder: (_) => [
              PopupMenuItem(
                enabled: false,
                child: Text(
                  'Olá', //${usuario?.nome.split(' ').first ?? 
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2C2C2A)),
                ),
              ),
              const PopupMenuDivider(),

              const PopupMenuItem(value: 'profile', child: Row(
                children: [Icon(Icons.account_circle_outlined, size: 18), SizedBox(width: 8), Text('Perfil')],
              )),
              
              const PopupMenuItem(value: 'sobre', child: Row(
                children: [Icon(Icons.info_outline, size: 18), SizedBox(width: 8), Text('Sobre')],
              )),
              
              const PopupMenuItem(value: 'sair', child: Row(
                children: [
                  Icon(
                    Icons.logout, 
                    size: 18, 
                    color: Color.fromARGB(255, 255, 17, 0)), 
                    SizedBox(width: 8), 
                    Text('Sair', 
                      style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 0)
                      )
                    )],
              )),
            ],
          ),
        ],
      ),



      body: _telas[_indiceAtual],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (i) => setState(() => _indiceAtual = i),
        selectedItemColor: const Color(0xFFE8734A),
        unselectedItemColor: const Color(0xFF888780),
        backgroundColor: Colors.white,
        elevation: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Adoção',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Voluntariado',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_searching_outlined),
            label: 'Explorar',
          ),
        ],
      ),
    );
  }
}



