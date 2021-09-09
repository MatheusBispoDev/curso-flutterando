import 'package:bloc_aulao/app/search_cep_bloc.dart';
import 'package:bloc_aulao/app/search_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';

class DioMock extends DioForNative {}

void main() {
  final dio = DioMock();

   blocTest<SearchCepBloc, SearchCepState>(
    'deve retornar uma cidade quando passar um cep por parametro',
    build: () => SearchCepBloc(dio),
    act: (bloc) => bloc.add('06260090'),
    expect: () => [
      isA<SearchCepLoading>(),
      isA<SearchCepSucess>(),
    ],
  );
}
