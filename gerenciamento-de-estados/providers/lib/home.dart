import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/hero_model.dart';
import 'package:providers/heroes_controller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //_buildList(HeroesController heroesController) {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
      onTap: () {
        heroesController.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavotired
          ? Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : Icon(Icons.star_border),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
              child: Text(
                '${heroesController.heroes.where((element) => element.isFavotired).length}',
                style: TextStyle(fontSize: 24),
              ),
            );
          },
        ),
      ),
      //Consumer é a parte que builda e constroi o widget com base nos atributos e é sempre atualizado quando é mudado
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}
