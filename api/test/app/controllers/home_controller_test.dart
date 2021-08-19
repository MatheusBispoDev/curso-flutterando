import 'package:api/app/controllers/home_controller.dart';
import 'package:api/app/models/todo_model.dart';
import 'package:api/app/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  test('deve preencher variavel todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async =>
        [TodoModel(id: null, completed: null, title: null, userId: null)]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
