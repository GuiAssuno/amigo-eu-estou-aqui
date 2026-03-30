import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:get_it/get_it.dart';

import 'view/login/tela_login.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<String>('Hello from GetIt!');

  runApp(DevicePreview(builder: (context) => const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Companheiro',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      
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
      
      home: const TelaLogin(),
    );
  }
}
