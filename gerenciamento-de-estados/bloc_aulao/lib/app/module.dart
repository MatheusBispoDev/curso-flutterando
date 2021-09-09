import 'package:bloc_aulao/app/home_page.dart';
import 'package:bloc_aulao/app/search_cep_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class appModule extends Module {
  final List<Bind<Object>> binds = [
    Bind.factory((i) => Dio()), // factory muda a instância cada vez que chamar
    Bind.singleton((i) => SearchCepBloc(i())), // Singleton mantém a mesma intância em todos os casos
  ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
