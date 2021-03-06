import 'package:bloc_guia_definitivo_2022/clients/client.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(nome: 'Matheus Bispo'),
      Client(nome: 'Layza Cristina'),
      Client(nome: 'Lucas Bispo'),
      Client(nome: 'Layla Regina'),
    ]);

    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}
