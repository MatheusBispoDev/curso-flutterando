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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            final can =
                Navigator.canPop(context); //Verifica se da pra fechar a rotas
            can ? Navigator.pop(context) : print('Não podemos fechar a rota');
          },
        ),
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
  Future<bool> _onWillPop() async {
    return (await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sem volta'),
            actions: [
              ElevatedButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              ElevatedButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, //Impede que o usuário volte para a outra tela
      child: Scaffold(
        appBar: AppBar(
          title: Text('Screen 2'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.maybePop(context); //Verifica se há algum WillPopScope, se tiver ele vai chamar a função _onWillPop - Funciona com o voltar do Android
            },
          ),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Navigator.pop(context, 'Dale familia'); //Passando parâmetro ao dar pop
            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => Screen3(),
                  settings:
                      RouteSettings(name: '/screen3', arguments: 'Title')),
            ); //Destroi a tela 2 e coloca a tela 3 no lugar dela
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
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
        title: Text('Screen 3'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*Navigator.popUntil(
            context,
            ModalRoute.withName('/'),
          ); //Fecha todas a telas, até parar na tela selecionada (no caso, a home) - Fechamento de fluxo*/
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => Screen4()),
              /*ModalRoute.withName('/screen2')); //Vai para a Screen 4 e fecha todas as telas entre a screen 4 e a screen 2*/
              (route) =>
                  false); //Ele vai matar todas as rotas e só deixar a tela que está
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
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
