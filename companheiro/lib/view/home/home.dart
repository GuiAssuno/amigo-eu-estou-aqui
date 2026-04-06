import 'package:companheiro/view/home/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '/view/ongs/ongs_page.dart';
import '/view/animais/animal_page.dart';
import '/view/voluntarios/voluntario_page.dart';
import '/view/sobre/sobre.dart';
import '/view/login/tela_login.dart';
import '/view/voluntarios/profile_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';


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
                    MyFlutterApp.logo,
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


      body: _telas[_indiceAtual],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,                                    // indice da tela atual
        onTap: (i) => setState(() => _indiceAtual = i),                // atualiza o estado para mudar a tela
        selectedItemColor: const Color.fromARGB(255, 0, 255, 55),    // cor do item selecionado
        unselectedItemColor: const Color.fromARGB(255, 253, 224, 0), // cor dos itens não selecionados
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),         // cor de fundo da barra
        showUnselectedLabels: true,                                    // mostra os rótulos dos itens não selecionados
        //enableFeedback: true,                                          // habilita feedback tátil e sonoro
        //type: BottomNavigationBarType.fixed, //deixa a barra fixa, sem animação de deslocamento
        //elevation: 22,                                                 // elevação da barra para dar sombra  
        ///key: 33,                                                       // chave para identificar o widget na árvore de widgets
        //unselectedFontSize: context.size.width * 0.035, // tamanho da fonte dos itens não selecionados proporcional à largura da tela
        //selectedFontSize: context.size.width * 0.04, // tamanho da fonte do item selecionado proporcional à largura da tela
        //unselectedIconTheme: context.iconTheme.copyWith(size: context.size.width * 0.06), // tamanho dos ícones dos itens não selecionados proporcional à largura da tela
        //selectedIconTheme: context.iconTheme.copyWith(size: context.size.width * 0.07), // tamanho do ícone do item selecionado proporcional à largura da tela
        //unselectedLabelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500), // estilo do rótulo dos itens não selecionados
        //selectedLabelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold), // estilo do rótulo do item selecionado
        //fixedColor: context.colorScheme.primary, // cor fixa para o item selecionado, usando a cor primária do tema 
        //mouseCursor: context.mouseCursor ?? SystemMouseCursors.click, // cursor do mouse ao passar sobre os itens
        //showSelectedLabels: context.size.width > 400, // mostra os rótulos dos itens selecionados apenas se a largura da tela for maior que 400 pixels
        //showUnselectedLabels: context.size.width > 400, // mostra os rótulos dos itens não selecionados apenas se a largura da tela for maior que 400 pixels
        //iconSize: context.size.width * 0.06, // tamanho dos ícones proporcional à largura da tela
        //landscapeLayout: context.size.width > 600 ? BottomNavigationBarLandscapeLayout.centered : BottomNavigationBarLandscapeLayout.spread, // layout para modo paisagem
        //useLegacyColorScheme: bool.fromEnvironment( 'useLegacyColorScheme', defaultValue: false), // usa o esquema de cores legado para compatibilidade com versões anteriores do Flutter 


        items: const [ // itens da barra de navegação

          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Voluntariado',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Adoção',
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



