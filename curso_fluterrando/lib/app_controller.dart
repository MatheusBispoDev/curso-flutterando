import 'package:flutter/material.dart';

// Gerenciador de estado

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  // Como se fosse um SetState para código ao invés de tela
  bool isDarkTheme = false;
  changeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners(); //Notifica quem está escutando
  }
}