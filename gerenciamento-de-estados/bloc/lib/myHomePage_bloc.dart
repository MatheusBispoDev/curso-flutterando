import 'dart:async';

class MyHomePageBloc {
  int counter = 0;

  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink; // Entrada de dados
  Stream get output => _streamController.stream; // Saída de dados

  void incrementCounter() {
    counter++;
    input.add(counter); //Passa o dado para o stream
  }
}
