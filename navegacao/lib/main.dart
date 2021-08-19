import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Navigator.defaultRouteName; //Pega o nome da primeira rota (rota padrão)
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Nav'),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
      },
      /*onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => MyHomePage(title: 'Flutter Nav'),
                settings: settings);
          case '/screen2':
            return CupertinoPageRoute(
                builder: (_) => Screen2(), settings: settings);
          case '/screen3':
            return CupertinoPageRoute(
                builder: (_) => Screen3(), settings: settings);
        }
      },*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/screen2');

          print(result);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pop(context, 'Dale familia'); //Passando parâmetro ao dar pop
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => Screen3(),
                settings: RouteSettings(name: '/screen3', arguments: 'Title')),
          ); //Destroi a tela 2 e coloca a tela 3 no lugar dela
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen3'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          ); //Fecha todas a telas, até parar na tela selecionada (no caso, a home) - Fechamento de fluxo
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
