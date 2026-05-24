import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {

  bool profileOng = false;
  ThemeMode temaMode = ThemeMode.system; 

  // Getters para a tela ler a informação
  bool get temaOng => profileOng; 
  ThemeMode get modoTema => temaMode;

  //  Mudar o perfil
  void setProfileType({required bool OngProfile}) {
    profileOng = OngProfile; 
    notifyListeners(); 
  }

  // claro/escuro manual
  void toggleThemeMode(bool isDark) {
    temaMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}