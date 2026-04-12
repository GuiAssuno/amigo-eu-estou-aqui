import 'package:companheiro/view/home/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '/view/sobre/sobre.dart';
import '../auth/tela_login.dart';
import '/view/voluntarios/profile_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

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
            const Icon(Icons.volunteer_activism, size: 22, color: Color(0xffE7DFD5),),
            const SizedBox(width: 8),
            //const Text('Companheiro'),
          ],
        ),

        actions: [          
          PopupMenuButton<String>(
            icon: Icon(Icons.account_circle, size: 22, color: const Color(0xffE7DFD5)),
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
                height: 16,
                enabled: false,
                child: Text(
                  'Olá', //${usuario?.nome.split(' ').first ?? 
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              const PopupMenuDivider(),

              const PopupMenuItem(value: 'profile', child: Row(
                children: [Icon(Icons.account_circle_outlined, size: 18, color: Color(0xff212A3E)), SizedBox(width: 8), Text('Perfil', )],
              )),
              
              const PopupMenuItem(value: 'sobre', child: Row(
                children: [Icon(Icons.info_outline, size: 18, color: Color(0xff212A3E),), SizedBox(width: 8), Text('Sobre')],
              )),
              
              const PopupMenuItem(value: 'sair', child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 18,
                    color: Color.fromARGB(255, 255, 17, 0),
                  ),
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

      body: Center(

      ),

    );
  }
}



