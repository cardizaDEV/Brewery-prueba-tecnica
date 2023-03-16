import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBlocEvent.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBlocState.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/data/models/brew.dart';
import 'package:http/http.dart' as http;

class BrewsBloc extends Bloc<BrewsBlocEvent, BrewsBlocState> {
  BrewsBloc(Type brewsBlocEvent, Type brewsBlocState)
      : super(BrewsBlocInitState(brews: [])) {
    on<BrewsBlocEvent>(
      (event, emit) async {
        emit(BrewsBlocLoading());
        final List<Brew>? brews = await _getBrews();
        emit(BrewsBlocLoaded(brews: brews));
      },
    );
  }

  Future<List<Brew>?> _getBrews() async {
    var url = Uri.parse(
        "https://api.punkapi.com/v2/beers?brewed_before=11-2012&abv_gt=6");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> values = jsonDecode(response.body);
      List<Brew>? brews = [];
      if (values.isNotEmpty) {
        for (var element in values) {
          brews.add(Brew. fromJson(element));
        }
      }
      return brews;
    } else {
      return null;
    }
  }
}
