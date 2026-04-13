import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  // Estado inicial: não é ONG e usa o tema do sistema (claro/escuro automático)
  bool _isNgo = false;
  ThemeMode _themeMode = ThemeMode.system;

  // Getters para a tela ler a informação
  bool get isNgo => _isNgo;
  ThemeMode get themeMode => _themeMode;

  // Ação: Mudar o perfil (Chame isso na hora do Login!)
  void setProfileType({required bool isNgoProfile}) {
    _isNgo = isNgoProfile;
    notifyListeners(); // Grita no megafone: "O TEMA MUDOU, RECARREGUEM AS TELAS!"
  }

  // Ação: Mudar claro/escuro (Você pode colocar num botão de configuração)
  void toggleThemeMode(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}