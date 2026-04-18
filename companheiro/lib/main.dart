import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '/controller/auth_controle.dart';
import '/controller/animal_controle.dart';
import 'controller/voluntariado_controle.dart';
import '/controller/tema_controle.dart';
import '/view/auth/tela_login.dart';
import '/view/theme/tema.dart';


final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<String>('Hello from GetIt!');

  runApp(
    DevicePreview(
      builder: (context) => MultiProvider(
        providers: [
          // Login e Senhas
          ChangeNotifierProvider(create: (_) => AuthController()), 
      
          // Cachorros e Gatos
          ChangeNotifierProvider(create: (_) => AnimalController()), 
        
          // Vagas de Voluntariado
          ChangeNotifierProvider(create: (_) => VoluntariadoController()), 
      
          // Modo Escuro
          ChangeNotifierProvider(create: (_) => ThemeController()),
        ],
        child: const MainApp(),
      ),
    ),
  );
}

//=====================================================================================================================        
//===================================================        MAIN APP       ===========================================    
//=====================================================================================================================  
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    //final temaController = Provider.of<ThemeController>(context);

    return MaterialApp( // aplicativo material design
      title: 'Companheiro',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),

      //theme: themeController.isNgo ? AppThemes.ngoLight : AppThemes.userLight,
      //darkTheme: themeController.isNgo ? AppThemes.ngoDark : AppThemes.userDark,
      //themeMode: themeController.themeMode,

//=====================================================================================================================        
//===================================================        TEMA       ===============================================        
//=====================================================================================================================  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed( // cores a partir de uma cor base
          seedColor: Color(0xFf84A9AC), // cor base para paleta de cores do tema claro
          primary: Color(0xFf84A9AC), // cor elementos principais e destaques
          secondary: Color(0xFF3B6978), // cor elementos interativos secundários e destaques
          surface: Color(0xFF204051), // Cor navegation bar
        ),
       
        useMaterial3: true, // uso do material design 3
        fontFamily: 'Roboto', // fonte do aplicativo
//__________________________________________________________APP_BAR______________________________________________________
        appBarTheme: const AppBarTheme(         
          backgroundColor: Color(0xFf3B6978), // cor de fundo da barra de aplicativos
          foregroundColor: Colors.white,      // cor do texto e ícones da barra de aplicativos
          elevation: 0,                         // elevação da barra de aplicativos
          centerTitle: true,                    // centraliza o título da barra de aplicativos
        ),
//_________________________________________________________BOTOES_ELEVADOS________________________________________________
        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom(              
            backgroundColor: const Color(0xFf84A9AC), // cor de fundo dos botões elevados
            foregroundColor: Colors.white,            // cor do texto dos botões elevados
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14), // padding interno para os botões elevados
            shape: RoundedRectangleBorder( // formato do botão
              borderRadius: BorderRadius.circular(12), // bordas arredondadas para os botões
            ),
          ),
        ),
//__________________________________________________________ENTRADAS_TEXTO________________________________________________
        inputDecorationTheme: InputDecorationTheme( 
          filled: true, // o campo de texto deve ser preenchido com uma cor de fundo
          fillColor: const Color(0xFFFDF6EE), // cor de fundo dos campos de texto
          border: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(12), // bordas arredondadas para os campos de texto
            borderSide: BorderSide.none, // sem borda para os campos de texto
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding interno dos campos de texto
        ),
//__________________________________________________________SCAFFOLD_____________________________________________________
        scaffoldBackgroundColor: const Color(0xFFFDF6EE), // cor de fundo para as telas do aplicativo
      ),
//=========================================================    DARK   ===================================================
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(      // cores a partir de uma cor base
          seedColor: const Color(0xFF52057B), // cor base para paleta de cores do tema escuro
          primary: const Color(0xFF52057B),   // cor elementos principais e destaques
          secondary: const Color(0xFF892CDC), // cor elementos interativos secundários e destaques
          surface: const Color(0XFF000000),   // Cor navegation bar
        ),
        useMaterial3: true,   // uso do material design 3
        fontFamily: 'Roboto', // fonte do aplicativo
//__________________________________________________________APP_BAR______________________________________________________
        appBarTheme: const AppBarTheme(         // tema para a barra de aplicativos
          backgroundColor: Color(0xFF52057B), // cor de fundo da barra de aplicativos
          foregroundColor: Colors.white,      // cor do texto e ícones da barra de aplicativos
          elevation: 0,                         // elevação da barra de aplicativos
          centerTitle: true,                    // centraliza o título da barra de aplicativos
        ),
//_________________________________________________________BOTOES_ELEVADOS________________________________________________
        elevatedButtonTheme: ElevatedButtonThemeData( // tema para os botões elevados
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF7D),                // cor de fundo
            foregroundColor: const Color.fromARGB(255, 170, 73, 73), // cor do texto 
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14), // padding interno 
            shape: RoundedRectangleBorder( // formato do botão
              borderRadius: BorderRadius.circular(12), // bordas arredondadas 
            ),
          ),
        ),
//__________________________________________________________ENTRADAS_TEXTO________________________________________________
        inputDecorationTheme: InputDecorationTheme( // tema para os campos de entrada de texto
          filled: true, // o campo de texto deve ser preenchido com uma cor de fundo
          fillColor: const Color(0xFF2C2C2A), // cor de fundo dos campos de texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // bordas arredondadas para os campos de texto
            borderSide: BorderSide.none, // sem borda para os campos de texto
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding interno dos campos de texto
        ),
//__________________________________________________________SCAFFOLD_____________________________________________________
        scaffoldBackgroundColor: const Color(0xFF2C2C2A), // cor de fundo para as telas do aplicativo
      ),
      
//====================================================    TELA INICIAL     ===============================================
      home: const TelaLogin(), // tela de login
    );
  }
}
