import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBloc.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBlocEvent.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBlocState.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/screens/detail_screen.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: _getProviders(),
        child: MaterialApp(
          title: 'Brewery',
          debugShowCheckedModeBanner: false,
          routes: _getRoutes(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MainScreen(),
        ));
  }

  List<BlocProvider> _getProviders() {
    return [
      BlocProvider<BrewsBloc>(
        create: (context) => BrewsBloc(BrewsBlocEvent,BrewsBlocState),
        ),
    ];
  }

  Map<String, WidgetBuilder> _getRoutes() {
    return {
      'MainScreen': (BuildContext context) => const MainScreen(),
      'DetailScreen': (BuildContext context) => const DetailScreen()
    };
  }
}
