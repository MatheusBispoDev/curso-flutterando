import 'dart:async';

import 'package:bloc/endereco_model.dart';
import 'package:dio/dio.dart';

class MyHomePageBloc {
  //int counter = 0;
  //final StreamController _streamController = StreamController();
  //Sink get input => _streamController.sink; // Entrada de dados
  //Stream get output => _streamController.stream; // Saída de dados
  //void incrementCounter() {
  //  counter++;
  //  input.add(counter); //Passa o dado para o stream
  //}

  final StreamController<String> _streamController = StreamController<String>();
  Sink<String> get input => _streamController.sink;
  Stream<EnderecoModel> get output => _streamController.stream
  .where((cep) => cep.length > 7)
  .asyncMap((cep) => _searchCep(cep)); // Saída de dados

  String url(String cep) => 'https://viacep.com.br/ws/$cep/json/';

  Future<EnderecoModel> _searchCep(String cep) async {
    Response response = await Dio().get(url(cep));
    return EnderecoModel.fromJson(response.data);
  }

}