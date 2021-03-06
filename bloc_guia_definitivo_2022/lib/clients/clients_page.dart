import 'dart:math';
import 'package:bloc_guia_definitivo_2022/clients/bloc/client_bloc.dart';
import 'package:bloc_guia_definitivo_2022/clients/bloc/client_events.dart';
import 'package:bloc_guia_definitivo_2022/clients/bloc/cliente_state.dart';
import 'package:bloc_guia_definitivo_2022/clients/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  // final clientsList = [];
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return [
      'Matheus Bispo',
      'Layza Cristina',
      'Lucas Bispo',
      'Layla Regina',
    ].elementAt(rand.nextInt(5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            onPressed: () {
              bloc.add(AddClientEvent(client: Client(nome: randomName())));
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientBloc, ClientState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ClientInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ClientSucessState) {
              final clientsList = state.clients;

              return ListView.separated(
                itemCount: clientsList.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (
                  context,
                  index,
                ) =>
                    ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      child: Text(clientsList[index].nome.substring(0, 1)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  title: Text(clientsList[index].nome),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      bloc.add(RemoveClientEvent(client: clientsList[index]));
                    },
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
