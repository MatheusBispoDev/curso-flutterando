import 'dart:async';

import 'package:bloc_guia_definitivo_2022/clients/bloc/client_events.dart';
import 'package:bloc_guia_definitivo_2022/clients/bloc/cliente_state.dart';
import 'package:bloc_guia_definitivo_2022/clients/client.dart';
import 'package:bloc_guia_definitivo_2022/clients/clients_repository.dart';

class ClientBloc {
  final _clientRepo = ClientsRepository();

  final StreamController<ClientEvent> _inputClientController =
      StreamController<ClientEvent>();
  final StreamController<ClientState> _outpuClientController =
      StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outpuClientController.stream;

  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ClientEvent event) {
    List<Client> clients = [];

    if (event is LoadClientEvent) {
      clients = _clientRepo.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepo.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepo.removeClient(event.client);
    }

    _outpuClientController.add(ClientSucessState(clients: clients));
  }
}
