import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'view/login/tela_login.dart';
import 'controller/controle_tema.dart';
import 'view/theme/tema.dart';


final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<String>('Hello from GetIt!');

  runApp(
    DevicePreview(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => ThemeController(),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);


    return MaterialApp(
      title: 'Companheiro',
      debugShowCheckedModeBanner: false,
      
      //theme: themeController.isNgo ? AppThemes.ngoLight : AppThemes.userLight,
      //darkTheme: themeController.isNgo ? AppThemes.ngoDark : AppThemes.userDark,
      //themeMode: themeController.themeMode,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFf84A9AC),
          primary: Color(0xFf84A9AC),
          secondary: Color(0xFF4CAF7D),
          surface: Color(0xFFFDF6EE),
        ),
       
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFf84A9AC),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFf84A9AC),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFDF6EE),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),

        scaffoldBackgroundColor: const Color(0xFFFDF6EE),
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 76, 76, 175),
          primary: const Color.fromARGB(255, 87, 76, 175),
          secondary: const Color.fromARGB(255, 134, 132, 172),
          surface: const Color.fromARGB(255, 42, 42, 44),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 99, 76, 175),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF7D),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF2C2C2A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),

        scaffoldBackgroundColor: const Color(0xFF2C2C2A),
      ),
      


      home: const TelaLogin(),
    );
  }
}
