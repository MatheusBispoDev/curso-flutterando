import 'package:bloc/bloc.dart';
import 'package:bloc_guia_definitivo_2022/clients/bloc/client_events.dart';
import 'package:bloc_guia_definitivo_2022/clients/bloc/cliente_state.dart';
import 'package:bloc_guia_definitivo_2022/clients/clients_repository.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final _clientRepo = ClientsRepository();

  ClientBloc() : super(ClientInitialState()) {
    on<LoadClientEvent>(
      ((event, emit) => emit(
            ClientSucessState(
              clients: _clientRepo.loadClients(),
            ),
          )),
    );

    on<AddClientEvent>(
      ((event, emit) => emit(
            ClientSucessState(
              clients: _clientRepo.addClient(event.client),
            ),
          )),
    );

    on<RemoveClientEvent>(
      ((event, emit) => emit(
            ClientSucessState(
              clients: _clientRepo.removeClient(event.client),
            ),
          )),
    );
  }
}
