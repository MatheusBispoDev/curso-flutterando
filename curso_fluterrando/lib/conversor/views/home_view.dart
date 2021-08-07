import 'package:cursofluterrando/conversor/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/money_logo.png',
                width: 150,
                height: 150,
                color: Colors.white,
              ),
              CurrencyBox(),
              SizedBox(height: 10),
              CurrencyBox(),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding:
                      EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                ),
                onPressed: () {},
                child: Text('Converter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
