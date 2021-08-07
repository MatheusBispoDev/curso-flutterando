import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    email = text;
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    if (email == 'dale' && password == 'dale') {
                      Navigator.of(context)
                          .pushReplacementNamed('/changeNotify');
                    } else {
                      print('incorreto');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
