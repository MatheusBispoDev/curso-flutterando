import 'package:cursofluterrando/conceitos_basicos/desafio/desafio_page.dart';
import 'package:flutter/material.dart';

class MyDesafio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        brightness: Brightness.light,
      ),
      home: DesafioPage(),
    );
  }
}
