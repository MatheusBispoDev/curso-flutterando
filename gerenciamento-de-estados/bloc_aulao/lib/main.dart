import 'package:bloc_aulao/app/home_page.dart';
import 'package:bloc_aulao/app/search_cep_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

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
