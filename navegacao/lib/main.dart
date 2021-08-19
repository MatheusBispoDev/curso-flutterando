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
      home: MyHomePage(
        title: 'Dale',
      ),
      /*routes: {
        '/': (context) => MyHomePage(title: 'Flutter Nav'),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
      },
      onGenerateRoute: (RouteSettings settings) {
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

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            final can =
                Navigator.canPop(context); //Verifica se da pra fechar a rotas
            can ? Navigator.pop(context) : print('Não podemos fechar a rota');
          },
        ),*/
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterProvider(_counter, child: GreatGrandFather()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/screen2');

          print(result);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
    );
  }
}

class CounterProvider extends InheritedWidget {
  final counter;

  CounterProvider(this.counter, {Key? key, required this.child})
      : super(key: key, child: child);

  final Widget child;

  //Pega e chama a instancia mais proxima do CounterProvider que esteja mias perto do widget e assim será possível usar o atributo counter
  static CounterProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CounterProvider>()
        as CounterProvider);
  }

  //Vai notificar e atualizar todos os dados que estão usando o CounterProvider
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class GreatGrandFather extends StatelessWidget {
  const GreatGrandFather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
      color: Colors.red,
      child: GrandFather(),
    );
  }
}

class GrandFather extends StatelessWidget {
  const GrandFather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 370,
        height: 220,
        color: Colors.purple,
        child: Father(),
      ),
    );
  }
}

class Father extends StatelessWidget {
  const Father({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        color: Colors.blue,
        child: Child(),
      ),
    );
  }
}

class Child extends StatelessWidget {
  const Child({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int counter = CounterProvider.of(context).counter;
    return Center(
      child: Container(
        width: 200,
        height: 120,
        color: Colors.orange,
        child: Center(
          child: Text('Dale: $counter'),
        ),
      ),
    );
  }
}



/*
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
*/