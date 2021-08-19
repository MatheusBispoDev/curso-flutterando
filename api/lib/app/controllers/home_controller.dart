import 'package:api/app/models/todo_model.dart';
import 'package:api/app/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

enum HomeState { start, loading, sucess, error }

class HomeController {
  List<TodoModel> todos = [];
  final _repository;
  //Adiciona a reatividade, notifica quando há alteração
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.sucess;
    } on Exception {
      state.value = HomeState.error;
    }
  }
}
