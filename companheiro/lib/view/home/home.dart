import 'package:flutter/material.dart';

import '/view/ongs/ongs_page.dart';
import '/view/home/home_page.dart';
import '/view/animais/animal_page.dart';
import '/view/voluntarios/voluntario_page.dart';
import '/view/sos/sos_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _indiceAtual = 1;

  final List<Widget> _telas = const [
     AnimalPage(),
     HomePage(),
     VoluntarioPage(),
     SosPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(  

      body: _telas[_indiceAtual],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,                        // indice da tela atual
        onTap: (i) => setState(() => _indiceAtual = i),   // atualiza o estado para mudar a tela
        
        //fixedColor: context.colorScheme.primary,                                                  // cor fixa para o item selecionado, usando a cor primária do tema 
        selectedItemColor: const Color(0xffE7DFD5),                                               // cor do item selecionado
        //selectedIconTheme: context.iconTheme.copyWith(size: context.size.width * 0.07),           // tamanho do ícone do item selecionado proporcional à largura da tela
        //selectedLabelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold), // estilo do rótulo do item selecionado
        //showSelectedLabels: context.size.width > 400,                                             // mostra os rótulos dos itens selecionados apenas se a largura da tela for maior que 400 pixels
        //selectedFontSize: context.size.width * 0.04,                                              // tamanho da fonte do item selecionado proporcional à largura da tela
        
        unselectedItemColor: const Color.fromARGB(255, 96, 116, 156),                               // cor dos itens não selecionados
        showUnselectedLabels: true,                                                                   // mostra os rótulos dos itens não selecionados |  (context.size.width > 400) mostra só se largura da tela for maior que 400 pixels
        //unselectedFontSize: context.size.width * 0.035,                                             // tamanho da fonte dos itens não selecionados proporcional à largura da tela
        //unselectedIconTheme: context.iconTheme.copyWith(size: context.size.width * 0.06),           // tamanho dos ícones dos itens não selecionados proporcional à largura da tela
        //unselectedLabelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500), // estilo do rótulo dos itens não selecionados 
        
        
        
        //backgroundColor: const Color.fromARGB(185, 33, 42, 62),  // cor de fundo da barra
        //type: BottomNavigationBarType.fixed,                     // deixa a barra fixa, sem animação de deslocamento
        //elevation: 22,                                           // elevação da barra para dar sombra  
        //iconSize: context.size.width * 0.06,                     // tamanho dos ícones proporcional à largura da tela

        //useLegacyColorScheme: bool.fromEnvironment(     // usa o esquema de cores legado para compatibilidade com versões anteriores do Flutter
        //'useLegacyColorScheme', defaultValue: false), 
        //landscapeLayout:                                // layout para modo paisagem
        //context.size.width > 600 ? 
        //BottomNavigationBarLandscapeLayout.centered : BottomNavigationBarLandscapeLayout.spread,                                                   

        //enableFeedback: true,                                         // habilita feedback tátil e sonoro
        //mouseCursor: context.mouseCursor ?? SystemMouseCursors.click, // cursor do mouse ao passar sobre os itens
        ///key: 33,                                                     // chave para identificar o widget na árvore de widgets        

        items: const [ // itens da barra de navegação
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Adoçao',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Voluntario',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.location_searching_outlined),
            label: 'S.O.S',          
          ),
         

        ],
      ),
    );
  }
}



