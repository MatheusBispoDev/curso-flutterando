import 'package:api/app/models/todo_model.dart';
import 'package:api/app/repositories/todo_repository.dart';

enum HomeState { start, loading, sucess, error }

class HomeController {
  List<TodoModel> todos = [];

  HomeState state = HomeState.start;

  final _repository;

  HomeController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state = HomeState.sucess;
    } on Exception {
      state = HomeState.error;
    }
  }
}
