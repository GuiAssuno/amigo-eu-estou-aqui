import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/view/sobre/sobre.dart';
import '/view/auth/tela_login.dart';
import '/view/profile/profile_page.dart';
import '/controller/auth_controle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//=================================================================================================
//=====================================      FUNÇÃO PARA CONFIRMAR O LOGOUT     ===================
//=================================================================================================
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
            onPressed: () async {
              await Provider.of<AuthController>(context, listen: false).logout();
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

//=================================================================================================
//==============================================     PAGINA    ====================================
//=================================================================================================
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
          ],
        ),
//=================================================================================================
//=====================================      MENU AppBAR     ======================================
//=================================================================================================
        actions: [          
          PopupMenuButton<String>(
            icon: Icon(Icons.account_circle, size: 22, color: const Color(0xffE7DFD5)),
//__________________________________________opções_do_menu_________________________________________

            onSelected: (opcao) {
              if (opcao == 'sobre') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TelaSobre()));
              } else if (opcao == 'sair') {
                _confirmarLogout();
              } else if (opcao == 'profile') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
              }
            },

            itemBuilder: (_) => [ PopupMenuItem( //     item do menu
              height: 16,
              enabled: false,
//____________________________________________________texto de boas vindas__________________________________________
              child: Text( 'Olá', style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),),
              ),
              const PopupMenuDivider(),
//________________________________________________________opção profile__________________________________________

              const PopupMenuItem(value: 'profile', child: Row(
                children: [Icon(Icons.account_circle_outlined, size: 18, color: Color(0xff212A3E)), SizedBox(width: 8), Text('Perfil', )],
              )),
//________________________________________________________opção sobre__________________________________________

              const PopupMenuItem(value: 'sobre', child: Row(
                children: [Icon(Icons.info_outline, size: 18, color: Color(0xff212A3E),), SizedBox(width: 8), Text('Sobre')],
              )),
//_________________________________________________________opção sair__________________________________________
              const PopupMenuItem(value: 'sair', child: Row(
                children:[
                  Icon(Icons.exit_to_app,size: 18, color: Color.fromARGB(255, 255, 17, 0)),
                  SizedBox(width: 8),
                  Text('Sair', style: TextStyle( color: Color.fromARGB(255, 255, 17, 0) ))
                ],
              )),
            ],
          ),
        ],
      ),
      
//=================================================================================================
//==============================================     CORPO    =====================================
//=================================================================================================

      body: Center(
      ),

    );
  }
}



