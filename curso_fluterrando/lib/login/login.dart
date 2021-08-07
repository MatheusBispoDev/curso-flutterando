import 'package:cursofluterrando/login/login_page.dart';
import 'package:cursofluterrando/my_change_notify/my_change_notify.dart';
import '../app_controller.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.red,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/changeNotify': (context) => MyChangeNotify(),
          },
        );
      },
    );
  }
}