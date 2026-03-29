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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFf84A9AC)),
       useMaterial3: true,
      ),
      
      home: const TelaLogin(),
    );
  }
}
