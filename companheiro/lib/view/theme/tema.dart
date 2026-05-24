import 'package:flutter/material.dart';

class TemasCores {

//=====================================================================================================================        
//===================================================        USER      ===============================================        
//===================================================================================================================== 
  static final ThemeData userLight = ThemeData( 
        colorScheme: ColorScheme.fromSeed( // cores a partir de uma cor base
          seedColor: const Color(0xFF84A9AC), // cor base para paleta de cores do tema claro
          primary: const Color(0xFF84A9AC),   // cor elementos principais e destaques
          secondary: const Color(0xFF3B6978), // cor elementos interativos secundários e destaques
          surface: const Color(0xFF204051),   // Cor navegation bar
        ),
       
        useMaterial3: true, // uso do material design 3
        fontFamily: 'Roboto', // fonte do aplicativo
//__________________________________________________________app_bar______________________________________________________
        appBarTheme: const AppBarTheme(         
          backgroundColor: Color(0xFF3B6978), // cor de fundo da barra de aplicativos
          foregroundColor: Colors.white,      // cor do texto e ícones da barra de aplicativos
          elevation: 0,                         // elevação da barra de aplicativos
          centerTitle: true,                    // centraliza o título da barra de aplicativos
        ),
//_________________________________________________________botoes_elevados________________________________________________
        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom(              
            backgroundColor: const Color(0xFF84A9AC), // cor de fundo dos botões elevados
            foregroundColor: Colors.white,            // cor do texto dos botões elevados
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14), // padding interno para os botões elevados
            shape: RoundedRectangleBorder( // formato do botão
              borderRadius: BorderRadius.circular(12), // bordas arredondadas para os botões
            ),
          ),
        ),
//__________________________________________________________entradas_texto________________________________________________
        inputDecorationTheme: InputDecorationTheme( 
          filled: true, // o campo de texto deve ser preenchido com uma cor de fundo
          fillColor: const Color(0xFFFDF6EE), // cor de fundo dos campos de texto
          border: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(12), // bordas arredondadas para os campos de texto
            borderSide: BorderSide.none, // sem borda para os campos de texto
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding interno dos campos de texto
        ),
//__________________________________________________________scaffold_____________________________________________________
        scaffoldBackgroundColor: const Color(0xFFFDF6EE), // cor de fundo para as telas do aplicativo
      ); 

//=====================================================================================================================        
//===================================================        DARK       ===============================================        
//===================================================================================================================== 
  static final ThemeData userDark = ThemeData(
        colorScheme: ColorScheme.fromSeed(      // cores a partir de uma cor base
          seedColor: const Color(0xFF52057B), // cor base para paleta de cores do tema escuro
          primary: const Color(0xFF52057B),   // cor elementos principais e destaques
          secondary: const Color(0xFF892CDC), // cor elementos interativos secundários e destaques
          surface: const Color(0xFF000000),   // Cor navegation bar
        ),
        useMaterial3: true,   // uso do material design 3
        fontFamily: 'Roboto', // fonte do aplicativo
//__________________________________________________________app_bar______________________________________________________
        appBarTheme: const AppBarTheme(         // tema para a barra de aplicativos
          backgroundColor: Color(0xFF52057B), // cor de fundo da barra de aplicativos
          foregroundColor: Colors.white,      // cor do texto e ícones da barra de aplicativos
          elevation: 0,                         // elevação da barra de aplicativos
          centerTitle: true,                    // centraliza o título da barra de aplicativos
        ),
//__________________________________________________________botoes_elevados________________________________________________
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
//__________________________________________________________entradas_texto________________________________________________
        inputDecorationTheme: InputDecorationTheme( // tema para os campos de entrada de texto
          filled: true, // o campo de texto deve ser preenchido com uma cor de fundo
          fillColor: const Color(0xFF2C2C2A), // cor de fundo dos campos de texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // bordas arredondadas para os campos de texto
            borderSide: BorderSide.none, // sem borda para os campos de texto
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding interno dos campos de texto
        ),
//__________________________________________________________scaffold_____________________________________________________
        scaffoldBackgroundColor: const Color(0xFF2C2C2A), // cor de fundo para as telas do aplicativo
      );

//=====================================================================================================================        
//===================================================        ONGs       ===============================================        
//===================================================================================================================== 
  static final ThemeData ongLight = ThemeData(
        colorScheme: ColorScheme.fromSeed( // cores a partir de uma cor base
          seedColor: const Color(0xFF84A9AC), // cor base para paleta de cores do tema claro
          primary: const Color(0xFF84A9AC),   // cor elementos principais e destaques
          secondary: const Color(0xFF3B6978), // cor elementos interativos secundários e destaques
          surface: const Color(0xFF204051),   // Cor navegation bar
        ),
       
        useMaterial3: true, // uso do material design 3
        fontFamily: 'Roboto', // fonte do aplicativo
//__________________________________________________________app_bar______________________________________________________
        appBarTheme: const AppBarTheme(         
          backgroundColor: Color(0xFF3B6978), // cor de fundo da barra de aplicativos
          foregroundColor: Colors.white,      // cor do texto e ícones da barra de aplicativos
          elevation: 0,                         // elevação da barra de aplicativos
          centerTitle: true,                    // centraliza o título da barra de aplicativos
        ),
//_________________________________________________________botoes_elevados________________________________________________
        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom(              
            backgroundColor: const Color(0xFF84A9AC), // cor de fundo dos botões elevados
            foregroundColor: Colors.white,            // cor do texto dos botões elevados
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14), // padding interno para os botões elevados
            shape: RoundedRectangleBorder( // formato do botão
              borderRadius: BorderRadius.circular(12), // bordas arredondadas para os botões
            ),
          ),
        ),
//__________________________________________________________entradas_texto________________________________________________
        inputDecorationTheme: InputDecorationTheme( 
          filled: true, // o campo de texto deve ser preenchido com uma cor de fundo
          fillColor: const Color(0xFFFDF6EE), // cor de fundo dos campos de texto
          border: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(12), // bordas arredondadas para os campos de texto
            borderSide: BorderSide.none, // sem borda para os campos de texto
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding interno dos campos de texto
        ),
//__________________________________________________________scaffold_____________________________________________________
        scaffoldBackgroundColor: const Color(0xFFFDF6EE), // cor de fundo para as telas do aplicativo
      );
//=====================================================================================================================        
//===================================================        DARK       ===============================================        
//===================================================================================================================== 
  static final ThemeData ongDark = ThemeData(
        colorScheme: ColorScheme.fromSeed(      // cores a partir de uma cor base
          seedColor: const Color(0xFF52057B), // cor base para paleta de cores do tema escuro
          primary: const Color(0xFF52057B),   // cor elementos principais e destaques
          secondary: const Color(0xFF892CDC), // cor elementos interativos secundários e destaques
          surface: const Color(0xFF000000),   // Cor navegation bar
        ),
        useMaterial3: true,   // uso do material design 3
        fontFamily: 'Roboto', // fonte do aplicativo
//__________________________________________________________app_bar______________________________________________________
        appBarTheme: const AppBarTheme(         // tema para a barra de aplicativos
          backgroundColor: Color(0xFF52057B), // cor de fundo da barra de aplicativos
          foregroundColor: Colors.white,      // cor do texto e ícones da barra de aplicativos
          elevation: 0,                         // elevação da barra de aplicativos
          centerTitle: true,                    // centraliza o título da barra de aplicativos
        ),
//_________________________________________________________botoes_elevados________________________________________________
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
//__________________________________________________________entradas_texto________________________________________________
        inputDecorationTheme: InputDecorationTheme( // tema para os campos de entrada de texto
          filled: true, // o campo de texto deve ser preenchido com uma cor de fundo
          fillColor: const Color(0xFF2C2C2A), // cor de fundo dos campos de texto
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // bordas arredondadas para os campos de texto
            borderSide: BorderSide.none, // sem borda para os campos de texto
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding interno dos campos de texto
        ),
//__________________________________________________________scaffold_____________________________________________________
        scaffoldBackgroundColor: const Color(0xFF2C2C2A), // cor de fundo para as telas do aplicativo
      );
}