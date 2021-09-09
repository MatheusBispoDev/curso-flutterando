import 'package:bloc_aulao/app/search_cep_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

initModule() {
  getIt.registerFactory(() => Dio());
  getIt.registerFactory(() => SearchCepBloc(getIt()));
}

disposeModule() {
  getIt<SearchCepBloc>().close();
  getIt.unregister<SearchCepBloc>();
  getIt.unregister<Dio>();
}