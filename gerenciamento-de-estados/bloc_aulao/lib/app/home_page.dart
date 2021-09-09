import 'package:bloc_aulao/app/search_cep_bloc.dart';
import 'package:bloc_aulao/app/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  //final searchCepBloc = SearchCepBloc();

  @override
  void dispose() {
    //searchCepBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'cep'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Pesquisar'),
              onPressed: () {
                //searchCepBloc.searchCep.add(textController.text);
                //searchCepBloc.add(textController.text);
                context
                    .read<SearchCepBloc>()
                    .add(textController.text); // Usando injeção de dependências
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<SearchCepBloc, SearchCepState>(
              // BlocBuilder<Bloc, TipoBloc> -> BlocBuilder<Tipo do bloc que está usando (Recebe), Estado do bloc (Envia)>
              bloc: context.read<
                  SearchCepBloc>(), // Não precisa nem passar o bloc quando está usando o MultiProvider, pois ele já identifica pela tipagem do BlocBuilder
              //stream: searchCepBloc.cepResult,
              builder: (context, state) {
                /*
                if (!state.hasData) {
                  return Container();
                }
                var state = state.data;*/

                if (state is SearchCepError) {
                  return Text(
                    'Cidade: ${state.message}',
                    style: TextStyle(color: Colors.red),
                  );
                }

                if (state is SearchCepLoading) {
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }

                state = state as SearchCepSucess;

                if (state.data.isEmpty) {
                  Container();
                }

                return Text(
                    'Cidade: ${state.data['localidade']}/${state.data['uf']}');
              },
            ),
          ],
        ),
      ),
    );
  }
}


/*
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  final searchCepBloc = SearchCepBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'cep'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Pesquisar'),
              onPressed: () {
                searchCepBloc.searchCep.add(textController.text);
              },
            ),
            SizedBox(height: 20),
            if (searchCepBloc.isLoading)
              Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            if (searchCepBloc.error != null)
              Text(searchCepBloc.error!, style: TextStyle(color: Colors.red)),
            if (!searchCepBloc.isLoading && searchCepBloc.cepResult.isNotEmpty)
              Text('Cidade: ${searchCepBloc.cepResult['localidade']}')
          ],
        ),
      ),
    );
  }
}
*/