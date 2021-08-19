import 'package:api/app/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  final url = 'https://jsonplaceholder.typicode.com/todos';
  Dio? dio;

  TodoRepository([Dio? dio]) {
    this.dio = dio ?? Dio();
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio!.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
