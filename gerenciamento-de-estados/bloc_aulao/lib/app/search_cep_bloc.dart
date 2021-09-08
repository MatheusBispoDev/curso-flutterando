import 'dart:async';
import 'package:dio/dio.dart';

class SearchCepBloc {
  // Entrada e saída
  final _streamController = StreamController<String>.broadcast(); // broadcast para a stream ser escutava por vários
  Sink<String> get searchCep => _streamController.sink; // Entrada
  //Stream<Map> get cepResult => _streamController.stream.asyncMap((cep) async => {}); // Saída -> cep veio do sink
  Stream<Map> get cepResult => _streamController.stream.asyncMap(_searchCep);

  var isLoading = false;

  Future<Map> _searchCep(String cep) async {
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
      return response.data;
    } catch (e) {
      throw Exception('Erro na pesquisa');
    }
  }

  void dispose() {
    _streamController.close();
  }

  //String? error;
  //var cepResult = {}; // Mesma variavel
  /*
  Future<void> _searchCep(String cep) async {
    try {
      cepResult = {};
      error = null;
      setState(() {
        isLoading = true;
      });
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');

      setState(() {
        cepResult = response.data;
      });
    } catch (e) {
      error = 'Erro na pesquisa';
    }
    setState(() {
      isLoading = false;
    });
  }*/
}
