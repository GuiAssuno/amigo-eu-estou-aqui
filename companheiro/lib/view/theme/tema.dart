import 'package:flutter/material.dart';

class AppThemes {
  // ==========================================
  // TEMAS PARA USUÁRIOS COMUNS (Ex: Azul)
  // ==========================================
  static final ThemeData userLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue, 
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData userDark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue, 
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );

  // ==========================================
  // TEMAS PARA ONGs (Ex: Laranja ou Verde)
  // ==========================================
  static final ThemeData ngoLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green, 
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData ngoDark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green, 
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}