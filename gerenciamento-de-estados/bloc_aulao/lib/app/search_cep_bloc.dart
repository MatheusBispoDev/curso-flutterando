import 'dart:async';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

// Contrato dos estados
abstract class SearchCepState {}

// Estados da tela na aplicação
class SearchCepSucess implements SearchCepState {
  final Map data;

  const SearchCepSucess(this.data);
}

class SearchCepLoading implements SearchCepState {
  const SearchCepLoading();
}

class SearchCepError implements SearchCepState {
  final String message;

  const SearchCepError(this.message);
}

class SearchCepBloc {
  // Entrada e saída
  final _streamController = StreamController<
      String>.broadcast(); // broadcast para a stream ser escutava por vários
  Sink<String> get searchCep => _streamController.sink; // Entrada
  //Stream<Map> get cepResult => _streamController.stream.asyncMap(_searchCep); // Saída -> cep veio do sink
  //Stream<Map> get cepResult => _streamController.stream.switchMap(_searchCep); // Retorna uma stream para outra stream
  Stream<SearchCepState> get cepResult => _streamController.stream
      .switchMap(_searchCep); // Retorna uma stream para outra stream

  // Future só tem 1 retorno
  // Stream tem quantos retornos quiser (async*)
  Stream<SearchCepState> _searchCep(String cep) async* {
    yield const SearchCepLoading();
    try {
      final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');

      yield SearchCepSucess(response.data);
    } catch (e) {
      yield const SearchCepError('Deu ruim!!!');
      //yield* Stream.error('Erro na pesquisa'); // yield* -> Retorno de stream
    }
  }

  void dispose() {
    _streamController.close();
  }

  //String? error;
  //var cepResult = {}; // Mesma variavel
  //var isLoading = false;
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
