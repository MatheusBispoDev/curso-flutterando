import 'package:flutter/material.dart';
import 'package:providers/hero_model.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Iron man'),
    HeroModel(name: 'Batman'),
    HeroModel(name: 'Captain America'),
    HeroModel(name: 'Superman'),
  ];

  checkFavorite(HeroModel model){
    model.isFavotired = !model.isFavotired;
    notifyListeners(); //Notifica o Consumer
  }
}