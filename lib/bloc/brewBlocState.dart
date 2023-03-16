import 'package:flutter/cupertino.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/data/models/brew.dart';

abstract class BrewsBlocState {
  final List<Brew>? brews;
  const BrewsBlocState({@required this.brews});
}

class BrewsBlocInitState extends BrewsBlocState {
  BrewsBlocInitState({required List<Brew>? brews}) : super(brews: brews);
}

class BrewsBlocLoading extends BrewsBlocState {}
class BrewsBlocLoaded extends BrewsBlocState {
  BrewsBlocLoaded({required List<Brew>? brews}) : super(brews: brews);
}
