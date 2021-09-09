import 'package:bloc_aulao/app/home_page.dart';
import 'package:bloc_aulao/app/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

// Usando GetIt
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // MultiProvider para aplicar o conceito de injeção de dependencia
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    ).modular();
  }
}

/*
// Usando MultiProvide
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MultiProvider para aplicar o conceito de injeção de dependencia
    return MultiProvider(
      providers: [
        Provider(create: (_) => Dio()), // Provider para instanciar o Dio
        BlocProvider(
            create: (context) => SearchCepBloc(
                context.read<Dio>())), // Passando o Dio com o provider
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
*/