// import 'package:companheiro/model/modelos.dart';
// import 'package:flutter/material.dart';

// import 'package:companheiro/view/animais/detalhe_animal.dart'; 


// class AnimalPage extends StatefulWidget { // tela que muda estado, corpo da televisão
//   const AnimalPage({super.key});

//   @override
//   State<AnimalPage> createState() => _AnimalPageState();
// }

// class _AnimalPageState extends State<AnimalPage> { // tela que muda estado, tela da televisão 
//   @override
  
//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Adoção', ),

//         titleSpacing: 16, // aqui pode ser personalizada a distância do título do appbar, caso seja necessário
      
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               // aqui pode ser personalizada a ação de atualização da lista de animais, caso seja necessário
//             },
//           ),
//         ],

//         //actionsIconTheme: context.theme.iconTheme.copyWith(color: Colors.white), // aqui pode ser personalizada a cor dos ícones de ação, caso seja necessário
//         //actionsPadding: context.padding.all(8), // aqui pode ser personalizada a distância entre

//         ),
      
//       body: Center(
//         //child: Text('Lista de Animais'),
//         // aqui pode ser personalizada a exibição da lista de animais, caso seja necessário
        
//         child: listaAnimais(),
        
      
//       ),
//     );
//   }
// }


// class FotoAnimal extends StatelessWidget { // tela que não muda estado
//   //  final Animal animal;
//   //const FotoAnimal({required this.animal});

//   final Color cor_fundo;
//   final String textodafoto;

//   const FotoAnimal({
//     super.key, 
//     required this.cor_fundo,
//     required this.textodafoto,
//   });


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           color: cor_fundo, // aqui pode ser personalizada a cor de fundo da imagem, caso seja necessário
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 1, 1, 1),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(textodafoto,
//             style: const TextStyle( 
//               color: Color.fromARGB(255, 241, 241, 241), 
//               fontWeight: FontWeight.bold
//             )
//           ), // aqui pode ser personalizada a exibição da foto do animal, caso seja necessário
//         ),
//       );
//   }
// }


//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================



//       //   animateColor: bool.fromEnvironment( 'ANIMAR_CORES', defaultValue: true), // aqui pode ser personalizada a animação de cores dos ícones de ação, caso seja necessário
//       //   bottom: context.widget is AppBar ? null : PreferredSize( // aqui pode ser personalizada a barra inferior do appbar, caso seja necessário
//       //     preferredSize: const Size.fromHeight(4), // aqui pode ser personalizada a altura da barra inferior do appbar, caso seja necessário
//       //     child: Container(
//       //       //color: context.theme.primaryColor, // aqui pode ser personalizada a cor da barra inferior do appbar, caso seja necessário
//       //       height: 4,
//       //     ),
//       //   ),
//       //   automaticallyImplyActions: bool.fromEnvironment(  'AUTOMATICAMENTE_IMPLICAR_ACOES', defaultValue: true), // aqui pode ser personalizada a implicação automática de ações, caso seja necessário
//       //   automaticallyImplyLeading: bool.fromEnvironment(  'AUTOMATICAMENTE_IMPLICAR_LEADING', defaultValue: true), // aqui pode ser personalizada a implicação automática de leading, caso seja necessário
//       //   centerTitle: context.widget is AppBar ? null : bool.fromEnvironment(  'CENTRALIZAR_TITULO', defaultValue: true), // aqui pode ser personalizada a centralização do título, caso seja necessário
//       //   elevation: context.widget is AppBar ? null : 4, // aqui pode ser personalizada a elevação do appbar, caso seja necessário
//       //   clipBehavior: context.widget is AppBar ? null : Clip.antiAlias, // aqui pode ser personalizada a forma de recorte do appbar, caso seja necessário
//       //   flexibleSpace: context.widget is AppBar ? null : Container( // aqui pode ser personalizada a área flexível do appbar, caso seja necessário
//       //     decoration: BoxDecoration(
//       //       gradient: LinearGradient(
//       //         colors: [Colors.blue, Colors.purple], // aqui pode ser personalizada a cor do gradiente da área flexível do appbar, caso seja necessário
//       //         begin: Alignment.topLeft,
//       //         end: Alignment.bottomRight,
//       //       ),
//       //     ),
//       //   ),
//       //   leading: context.widget is AppBar ? null : IconButton( // aqui pode ser personalizado o ícone de leading do appbar, caso seja necessário
//       //       icon: Icon(Icons.arrow_back), // aqui pode ser personalizado o ícone de leading do appbar, caso seja necessário
//       //       onPressed: () => Navigator.pop(context), // aqui pode ser personalizada a ação do ícone de leading do appbar, caso seja necessário
//       //     ),
//       //     notificationPredicate: (notification) => notification is ScrollNotification, // aqui pode ser personalizada a predicação de notificações do appbar, caso seja necessário
//       //     //primary: context.widget is AppBar ? null : true, // aqui pode ser personalizada a prioridade do appbar, caso seja necessário
//       //     shape: context.widget is AppBar ? null : RoundedRectangleBorder( // aqui pode ser personalizada a forma do appbar, caso seja necessário
//       //       borderRadius: BorderRadius.circular(16), // aqui pode ser personalizada a borda do appbar, caso seja necessário
//       //     ),
//       //     //iconTheme: context.theme.iconTheme.copyWith(color: Colors.white), // aqui pode ser personalizada a cor dos ícones do appbar, caso seja necessário
//       //     //textTheme: context.theme.textTheme.copyWith(headline6: context.theme.textTheme.headline6?.copyWith(color: Colors.white)), // aqui pode ser personalizada a cor do texto do appbar, caso seja necessário 
//       //     forceMaterialTransparency: bool.fromEnvironment(  'FORCAR_TRANSPARENCIA_MATERIAL', defaultValue: false), // aqui pode ser personalizada a transparência do material do appbar, caso seja necessário
//       //     leadingWidth: context.widget is AppBar ? null : 56, // aqui pode ser personalizada a largura do ícone de leading do appbar, caso seja necessário
//       //     toolbarHeight: context.widget is AppBar ? null : 56, // aqui pode ser personalizada a altura da toolbar do appbar, caso seja necessário
//       //     excludeHeaderSemantics: bool.fromEnvironment( 'EXCLUIR_SEMANTICA_CABECALHO', defaultValue: false), // aqui pode ser personalizada a exclusão da semântica do cabeçalho do appbar, caso seja necessário
//       //     //actionsOverflowButtonSpacing: context.padding.all(4), // aqui pode ser personalizada a distância entre os ícones de ação quando houver overflow, caso seja necessário
//       //     //actionsOverflowDirection: VerticalDirection.down, // aqui pode ser personalizada a direção do overflow dos ícones de ação, caso seja necessário
//       //     //actionsOverflowAlignment: OverflowBarAlignment.end, // aqui pode ser personalizada a alinhamento do overflow dos ícones de ação, caso seja necessário
//       //     //actionsOverflowFadeDuration: const Duration(milliseconds: 300), // aqui pode ser personalizada a duração da animação de fade do overflow dos ícones de ação, caso seja necessário
//       //     //actionsOverflowColor: Colors.white, // aqui pode ser personalizada a cor do overflow dos ícones de ação, caso seja necessário
//       //     //actionsOverflowElevation: 4, // aqui pode ser personalizada a elevação do overflow dos ícones de ação, caso seja necessário
//       //     //actionsOverflowShape: RoundedRectangleBorder( // aqui pode ser personalizada a forma do overflow dos ícones de ação, caso seja necessário
//       //     //  borderRadius: BorderRadius.circular(8), // aqui pode ser personalizada a borda do overflow dos ícones de ação, caso seja necessário
//       //     //),  
//       //     //toolbarTextStyle: context.theme.textTheme.headline6, // aqui pode ser personalizada a cor do texto da toolbar do appbar, caso seja necessário
//       //     //titleTextStyle: context.theme.textTheme.headline6, // aqui pode ser personalizada a cor do texto do título do appbar, caso seja necessário
//       //     //titleSpacing: context.padding.all(16), // aqui pode ser personalizada a distância do título do appbar, caso seja necessário
//       //     //toolbarOpacity: 1, // aqui pode ser personalizada a opacidade da toolbar do appbar, caso seja necessário
//       //     bottomOpacity: 1, // aqui pode ser personalizada a opacidade da barra inferior do appbar, caso seja necessário
//       //     //surfaceTintColor: context.theme.surfaceTintColor, // aqui pode ser personalizada a cor de tinta da superfície do appbar, caso seja necessário
//       //     scrolledUnderElevation: context.widget is AppBar ? null : 4, // aqui pode ser personalizada a elevação do appbar quando estiver rolado sob, caso seja necessário
//       //     //scrolledUnderSurfaceTintColor: context.widget is AppBar ? null : context.theme.surfaceTintColor, // aqui pode ser personalizada a cor de tinta da superfície do appbar quando estiver rolado sob, caso seja necessário
//       //     //scrolledUnderShadowColor: context.widget is AppBar ? null : context.theme.shadowColor, // aqui pode ser personalizada a cor da sombra do appbar quando estiver rolado sob, caso seja necessário 
//       //     //systemOverlayStyle: context.theme.appBarTheme.systemOverlayStyle, // aqui pode ser personalizada a cor do sistema de sobreposição do appbar, caso seja necessário 
//       //     useDefaultSemanticsOrder: bool.fromEnvironment( 'USAR_ORDEM_SEMANTICA_PADRAO', defaultValue: true), // aqui pode ser personalizada a ordem semântica do appbar, caso seja necessário
//       //     //shadowColor: context.theme.shadowColor, // aqui pode ser personalizada a cor da sombra do appbar, caso seja necessário
//       //     //surfaceTintColor: context.theme.surfaceTintColor, // aqui pode ser personalizada a cor de tinta da superfície do appbar, caso seja necessário
//       //     //backgroundColor: context.theme.primaryColor, // aqui pode ser personalizada a cor de fundo do appbar, caso seja necessário
//       //     foregroundColor: Colors.white, // aqui pode ser personalizada a cor de primeiro plano do appbar, caso seja necessário
//       //     //iconTheme: context.theme.iconTheme.copyWith(color: Colors.white), // aqui pode ser personalizada a cor dos ícones do appbar, caso seja necessário
//       //     key: context.widget.key, // aqui pode ser personalizada a chave do appbar, caso seja necessário


//       // ),
      
//       // primary: bool.fromEnvironment(  'USAR_APPBAR_PRIMARIA', defaultValue: true), // aqui pode ser personalizada a prioridade do appbar, caso seja necessário
//       // //automaticallyImplyLeading: bool.fromEnvironment(  'AUTOMATICAMENTE_IMPLICAR_LEADING', defaultValue: true), // aqui pode ser personalizada a implicação automática de leading, caso seja necessário

//       // body: ListView(
//       //   padding: const EdgeInsets.all(16), // aqui pode ser personalizada a distância do conteúdo da lista, caso seja necessário
//       //   children: [
//       //     Container(
//       //       height: 200,
//       //       decoration: BoxDecoration(
//       //         color: const Color.fromARGB(255, 197, 50, 50), // aqui pode ser personalizada a cor de fundo da imagem, caso seja necessário
//       //         borderRadius: BorderRadius.circular(16), // aqui pode ser personalizada a borda da imagem, caso seja necessário
//       //         boxShadow: [
//       //           BoxShadow(
//       //             color: Colors.black.withOpacity(0.1), // aqui pode ser personalizada a cor da sombra da imagem, caso seja necessário
//       //             blurRadius: 8, // aqui pode ser personalizada a intensidade da sombra da imagem, caso seja necessário
//       //             offset: const Offset(0, 4), // aqui pode ser personalizada a posição da
//       //             //sombra da imagem, caso seja necessário
//       //           ),
//       //         ],  
//       //       ),
//       //       child: Center(
//       //         child: Text('Foto do Animal'), // aqui pode ser personalizada a exibição da foto do animal, caso seja necessário
//       //       ),  
//       //     ),
//       //   ]

//       // ),
//       // aqui pode ser personalizada a exibição da lista de animais, caso seja necessário
      
//       //bottomSheet: context.widget is Scaffold ? null : Container( // aqui pode ser personalizada a barra inferior do scaffold, caso seja necessário
//      //     height: 60,
//      //     color: const Color.fromARGB(255, 138, 17, 17),
//      //     child: Center(
//       //      child: Text('Informações adicionais sobre o animal'), // aqui pode ser personalizada a exibição de informações adicionais sobre o animal, caso seja necessário
//        //   ),
//      //   ),
//       //backgroundColor: context.theme.scaffoldBackgroundColor, // aqui pode ser personalizada a cor de fundo do scaffold, caso seja necessário
//       //resizeToAvoidBottomInset: true, // aqui pode ser personalizada a redimensionamento do scaffold para evitar o teclado, caso seja necessário

//       // drawer: context.widget is Scaffold ? null : Drawer( // aqui pode ser personalizada a gaveta do scaffold, caso seja necessário
//       //   child: ListView(
//       //     padding: EdgeInsets.zero,
//       //     children: [
//       //       const DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: Color.fromARGB(255, 0, 0, 0),
//       //         ),
//       //         child: Text('Menu',
//       //           style: TextStyle(
//       //             color: Colors.white,
//       //             fontSize: 24,
//       //           ),
//       //         ),
//       //         ),
//       //         ListTile(
//       //           leading: const Icon(Icons.home),
//       //           title: const Text('Início'),
//       //           onTap: () {
//       //             // Navegar para a tela de início
//       //           },
//       //         ),
//       //         ListView.builder(
//       //           shrinkWrap: true,
//       //           itemCount: 5, // aqui pode ser personalizada a quantidade de itens da lista, caso seja necessário
//       //           itemBuilder: (context, index) {
//       //             return ListTile(
//       //               leading: const Icon(Icons.pets),
//       //               title: Text('Animal ${index + 1}'), // aqui pode ser personalizada a exibição do nome do animal, caso seja necessário
//       //               onTap: () {
//       //                 // Navegar para a tela de detalhes do animal
//       //               },
//       //             );
//       //           },
//       //         ),
//       //     ],
//       // ),
              
//       // )


//     //);
//   //}
// //}


//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================

// Widget listaAnimais() {
//     // aqui pode ser personalizada a lista de animais, caso seja necessário
//   final List<Color> coresDasFotos = [
//     const Color.fromARGB(255, 81, 143, 86),
//     const Color.fromARGB(255, 134, 38, 38),
//     const Color.fromARGB(255, 44, 46, 139),
//   ];

//     return ListView.builder(
//       itemCount: 20,
//       itemBuilder: (context, index){
        
//         return InkWell(
//           onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => DetalheAnimal(),)
//           ),
        
//           child: Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             elevation: 4,
//             color: Color.fromARGB(255, 214, 214, 212),
//             child: Padding (
//               padding: EdgeInsets.only(left: 8, right: 8),

//               child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
              
//               children: [ 
//                 SizedBox(height: 8),
//                 Container(
//                   height: 300,
//                   child: PageView.builder(
//                     itemCount: coresDasFotos.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return FotoAnimal(
//                         cor_fundo: coresDasFotos[index], 
//                         textodafoto: 'Imagem ${index + 1}'
//                       );                      
//                     },
//                   ),
//                 ),
                

//                   const SizedBox(height: 16),
//                   const Text('Nome do Animal ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   const Text('Raça do Animal', style: TextStyle(fontSize: 14, color: Color(0xFF5F5E5A))),
//                   const SizedBox(height: 8),
//                   const Text('Descrição breve sobre o animal para atrair os adotantes.', style: TextStyle(fontSize: 12, color: Color(0xFF5F5E5A))),
                      
//                 ],
//               ),
            
//             ),
          


//           ),

//         );
//       },

//     );
// }





//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================


// // return ListView.builder(
// //       itemCount: 10, // aqui pode ser personalizada a quantidade de animais na lista, caso seja necessário
// //       itemBuilder: (context, index) {
// //         return InkWell(
// //           onTap: () => Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => DetalheAnimal()),
// //           ),
// //           child: Card(
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //             elevation: 4,
// //             child: Padding(
// //               padding: const EdgeInsets.all(16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container(
// //                     height: 150,
// //                     decoration: BoxDecoration(
// //                       color: const Color.fromARGB(255, 197, 50, 50),
// //                       borderRadius: BorderRadius.circular(16),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.black.withOpacity(0.1),
// //                           blurRadius: 8,
// //                           offset: const Offset(0, 4),
// //                         ),
// //                       ],  
// //                     ),
                    
// //                     child: PageView(
// //                       children: [
// //                         Container(
// //                           color: const Color.fromARGB(255, 197, 50, 50),
// //                           child: const Center(
// //                             child: Text('Foto do Animal - Imagem 1'),
// //                           ),
// //                         ),
// //                         Container(
// //                           color: const Color.fromARGB(255, 138, 17, 17),
// //                           child: const Center(
// //                             child: Text('Foto do Animal - Imagem 2'),
// //                           ),
// //                         ),
// //                         Container(
// //                           color: const Color.fromARGB(255, 255, 0, 0),
// //                           child: const Center(
// //                             child: Text('Foto do Animal - Imagem 3'),
// //                           ),
// //                         ),
// //                       ],
// //                     ), 
                    
 
// //                   ),
// //                   const SizedBox(height: 16),
// //                   const Text('Nome do Animal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 8),
// //                   const Text('Raça do Animal', style: TextStyle(fontSize: 14, color: Color(0xFF5F5E5A))),
// //                   const SizedBox(height: 8),
// //                   const Text('Descrição breve sobre o animal para atrair os adotantes.', style: TextStyle(fontSize: 12, color: Color(0xFF5F5E5A))),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// // }


//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================
//=======================================================================================================================================================================


//   //   return InkWell (
//   //     Card(
//   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//   //       elevation: 4,
//   //       child: Padding(
//   //         padding: const EdgeInsets.all(16),
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Container(
//   //               height: 150,
//   //               decoration: BoxDecoration(
//   //                 color: const Color.fromARGB(255, 197, 50, 50), // aqui pode ser personalizada a cor de fundo da imagem, caso seja necessário
//   //                 borderRadius: BorderRadius.circular(16), // aqui pode ser personalizada a borda da imagem, caso seja necessário
//   //                 boxShadow: [
//   //                   BoxShadow(
//   //                     color: Colors.black.withOpacity(0.1), // aqui pode ser personalizada a cor da sombra da imagem, caso seja necessário
//   //                     blurRadius: 8, // aqui pode ser personalizada a intensidade da sombra da imagem, caso seja necessário
//   //                     offset: const Offset(0, 4), // aqui pode ser personalizada a posição da sombra da imagem, caso seja necessário
//   //                   ),
//   //                 ],  
//   //               ),
//   //               child: Center(
//   //                 child: Text('Foto do Animal'), // aqui pode ser personalizada a exibição da foto do animal, caso seja necessário
//   //               ),  
//   //             ),
//   //             const SizedBox(height: 16),
//   //             Text('Nome do Animal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // aqui pode ser personalizada a exibição do nome do animal, caso seja necessário
//   //             const SizedBox(height: 8),
//   //             Text('Raça do Animal', style: const TextStyle(fontSize: 14, color: Color(0xFF5F5E5A))), // aqui pode ser personalizada a exibição da raça do animal, caso seja necessário
//   //             const SizedBox(height: 8),
//   //             Text('Descrição breve sobre o animal para atrair os adotantes.', style: const TextStyle(fontSize: 12, color: Color(0xFF5F5E5A))), // aqui pode ser personalizada a exibição da descrição do animal, caso seja necessário
//   //           ],
      
//   //     child: ListView.builder(
//   //           itemCount: 10, // aqui pode ser personalizada a quantidade de animais na lista, caso seja necessário
//   //           itemBuilder: (context, index) {
            
//   //             return ListTile(
//   //               leading: const Icon(Icons.pets), // aqui pode ser personalizada a exibição do ícone do animal, caso seja necessário
//   //               title: Text('Animal ${index + 1}'), // aqui pode ser personalizada a exibição do nome do animal, caso seja necessário
//   //               subtitle: Text('Raça do Animal ${index + 1}'), // aqui pode ser personalizada a exibição da raça do animal, caso seja necessário
//   //               onTap: ( )  => (Navigator.push( context,// aqui pode ser personalizada a ação de toque no item da lista de animais, caso seja necessário
//   //                   MaterialPageRoute( builder: (context) => DetalheAnimal(),// Aqui você chama a sua tela de detalhes, passando os dados se precisar

//   //                   ),
//   //                 )
//   //               ),
//   //             );
//   //           },
//   //         ),
//   //   );
    
//   // }





//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================
//=========================================================================================================================================================

// import 'package:flutter/material.dart';

// import '/view/ongs/ongs_page.dart';
// import '/view/home/home_page.dart';
// import '/view/animais/animal_page.dart';
// import '/view/voluntariado/voluntario_page.dart';
// import '/view/sos/sos_page.dart';
// // import 'package:flutter_svg/flutter_svg.dart';


// class Home extends StatefulWidget {
//   const Home({super.key});
  
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _indiceAtual = 1;

//   final List<Widget> _telas = const [
//      AnimalPage(),
//      HomePage(),
//      VoluntarioPage(),
//      SosPage(),
//   ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(  

//       body: _telas[_indiceAtual],
      
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _indiceAtual,                        // indice da tela atual
//         onTap: (i) => setState(() => _indiceAtual = i),   // atualiza o estado para mudar a tela
        
//         //fixedColor: context.colorScheme.primary,                                                  // cor fixa para o item selecionado, usando a cor primária do tema 
//         selectedItemColor: const Color(0xffE7DFD5),                                               // cor do item selecionado
//         //selectedIconTheme: context.iconTheme.copyWith(size: context.size.width * 0.07),           // tamanho do ícone do item selecionado proporcional à largura da tela
//         //selectedLabelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold), // estilo do rótulo do item selecionado
//         //showSelectedLabels: context.size.width > 400,                                             // mostra os rótulos dos itens selecionados apenas se a largura da tela for maior que 400 pixels
//         //selectedFontSize: context.size.width * 0.04,                                              // tamanho da fonte do item selecionado proporcional à largura da tela
        
//         unselectedItemColor: const Color.fromARGB(255, 96, 116, 156),                               // cor dos itens não selecionados
//         showUnselectedLabels: true,                                                                   // mostra os rótulos dos itens não selecionados |  (context.size.width > 400) mostra só se largura da tela for maior que 400 pixels
//         //unselectedFontSize: context.size.width * 0.035,                                             // tamanho da fonte dos itens não selecionados proporcional à largura da tela
//         //unselectedIconTheme: context.iconTheme.copyWith(size: context.size.width * 0.06),           // tamanho dos ícones dos itens não selecionados proporcional à largura da tela
//         //unselectedLabelStyle: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500), // estilo do rótulo dos itens não selecionados 
        
        
        
//         //backgroundColor: const Color.fromARGB(185, 33, 42, 62),  // cor de fundo da barra
//         //type: BottomNavigationBarType.fixed,                     // deixa a barra fixa, sem animação de deslocamento
//         //elevation: 22,                                           // elevação da barra para dar sombra  
//         //iconSize: context.size.width * 0.06,                     // tamanho dos ícones proporcional à largura da tela

//         //useLegacyColorScheme: bool.fromEnvironment(     // usa o esquema de cores legado para compatibilidade com versões anteriores do Flutter
//         //'useLegacyColorScheme', defaultValue: false), 
//         //landscapeLayout:                                // layout para modo paisagem
//         //context.size.width > 600 ? 
//         //BottomNavigationBarLandscapeLayout.centered : BottomNavigationBarLandscapeLayout.spread,                                                   

//         //enableFeedback: true,                                         // habilita feedback tátil e sonoro
//         //mouseCursor: context.mouseCursor ?? SystemMouseCursors.click, // cursor do mouse ao passar sobre os itens
//         ///key: 33,                                                     // chave para identificar o widget na árvore de widgets        

//         items: const [ // itens da barra de navegação
//           BottomNavigationBarItem(
//             icon: Icon(Icons.pets),
//             label: 'Adoçao',
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
            
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.handshake),
//             label: 'Voluntario',
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.location_searching_outlined),
//             label: 'S.O.S',          
//           ),
         

//         ],
//       ),
//     );
//   }
// }