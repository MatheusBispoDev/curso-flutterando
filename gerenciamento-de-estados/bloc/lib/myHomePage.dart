import 'package:bloc/endereco_model.dart';
import 'package:bloc/myHomePage_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyHomePageBloc bloc = MyHomePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                bloc.input.add(value);
              },
              decoration: InputDecoration(
                hintText: 'Digite seu CEP',
                border: OutlineInputBorder(),
              ),
            ),
            Center(
              child: StreamBuilder<EnderecoModel>(
                initialData: EnderecoModel(bairro: 'Sem bairro'),
                stream: bloc.output,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'Eror na pesquisa',
                      style: TextStyle(color: Colors.red),
                    );
                  }

                  EnderecoModel? model = snapshot.data;
                  return Text('Bairro: ${model!.bairro}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyHomePageBloc bloc = MyHomePageBloc();

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
            StreamBuilder(
              stream: bloc.output,
              builder: (context, snapshot) {
              return Text(
                '${bloc.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
*/