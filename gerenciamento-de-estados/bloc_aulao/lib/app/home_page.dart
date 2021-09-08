import 'package:bloc_aulao/app/search_cep_bloc.dart';
import 'package:flutter/material.dart';

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
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Pesquisar'),
              onPressed: () {
                searchCepBloc.searchCep.add(textController.text);
              },
            ),
            SizedBox(height: 20),
            StreamBuilder<SearchCepState>(
              stream: searchCepBloc.cepResult,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                var state = snapshot.data;

                if (state is SearchCepError) {
                  return Text(
                    'Cidade: ${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  );
                }

                if (state is SearchCepLoading) {
                  return Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }

                state = state as SearchCepSucess;
                return Text('Cidade: ${state.data['localidade']}');
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