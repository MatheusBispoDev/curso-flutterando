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

class DesafioPage extends StatelessWidget {

  String title = 'Location Changer';
  String subTitle = 'Plugin app for Theme';
  String descButton = 'Logins with Facebook';
  Color colorSecond = Colors.white;
  Color colorPrimary = Colors.pinkAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/tinder_logo.png'),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: colorSecond,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 30),
              child: Text(
                subTitle,
                style: TextStyle(
                  color: colorSecond,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
                child: Text(
                  descButton,
                  style: TextStyle(color: colorPrimary),
                ),
                style: ElevatedButton.styleFrom(
                  primary: colorSecond,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  padding: EdgeInsets.only(
                      left: 60, right: 60, top: 20, bottom: 20),
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
