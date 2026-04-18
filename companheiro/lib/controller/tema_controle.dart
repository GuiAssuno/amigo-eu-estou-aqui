import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  // não é ONG e usa o tema do sistema 
  bool _isNgo = false;
  ThemeMode _themeMode = ThemeMode.system; // modo de tema padrão, usar tema do sistema, tema automático, tema claro/escuro automático, configuração de tema padrão

  // Getters para a tela ler a informação
  bool get isNgo => _isNgo; // verificar se o perfil é de ONG, checar tipo de perfil, confirmar perfil de ONG, validar perfil de ONG, identificar perfil de ONG
  ThemeMode get themeMode => _themeMode; // obter o modo de tema atual, ler o modo de tema, acessar o modo de tema, verificar o modo de tema, consultar o modo de tema

  //  Mudar o perfil
  void setProfileType({required bool isNgoProfile}) {
    _isNgo = isNgoProfile; // definir o tipo de perfil, alternar entre ONG e usuário comum, configurar perfil de ONG ou comum, atualizar tipo de perfil, aplicar perfil de ONG ou comum
    notifyListeners(); // notificar ouvintes, atualizar interface, atualizar tela, atualizar estado, atualizar visualização
  }

  // claro/escuro manual
  void toggleThemeMode(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light; // definir o modo de tema com base na escolha do usuário, alternar entre claro e escuro, configurar tema claro ou escuro, atualizar modo de tema, aplicar tema claro ou escuro
    notifyListeners();
  }
}