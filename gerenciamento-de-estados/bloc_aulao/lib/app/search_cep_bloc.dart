import 'dart:async';
import 'package:bloc_aulao/app/search_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc<Entrada, Saida> -> Bloc<Sink, Stream>
class SearchCepBloc extends Bloc<String, SearchCepState>{

  final Dio dio;

  SearchCepBloc(this.dio) : super(SearchCepSucess({})); // Construtor para o valor inicial, no caso, passa vazio

  @override
  Stream<SearchCepState> mapEventToState(String cep)  async* {
    yield const SearchCepLoading();
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');

      yield SearchCepSucess(response.data);
    } catch (e) {
      yield const SearchCepError('Deu ruim!!!');
      //yield* Stream.error('Erro na pesquisa'); // yield* -> Retorno de stream
    }
  }
}

/*
class SearchCepBloc {
  // Entrada e saída
  final _streamController = StreamController<
      String>.broadcast(); // broadcast para a stream ser escutava por vários
  Sink<String> get searchCep => _streamController.sink; // Entrada
  //Stream<Map> get cepResult => _streamController.stream.asyncMap(_searchCep); // Saída -> cep veio do sink
  //Stream<Map> get cepResult => _streamController.stream.switchMap(_searchCep); // Retorna uma stream para outra stream
  Stream<SearchCepState> get cepResult => _streamController.stream
      .switchMap(_searchCep); // Retorna uma stream para outra stream com a tipagem da stream para SearchCepState

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
}
*/