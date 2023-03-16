import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBloc.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBlocEvent.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/bloc/brewBlocState.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/widgets/brew_cell.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Brewer Master'),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 255, 211, 123)),
          backgroundColor: const Color.fromARGB(255, 255, 211, 123),
        ),
        body: BlocBuilder<BrewsBloc, BrewsBlocState>(
          builder: (BuildContext context, state) {
            if (state is BrewsBlocLoaded) {
              return Container(
                color: const Color.fromARGB(255, 255, 248, 246),
                child: SafeArea(
                    child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: state.brews?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return state.brews!.isNotEmpty
                        ? BrewCell(brew: state.brews![index])
                        : Container();
                  },
                )),
              );
            } else if (state is BrewsBlocLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 211, 123),
                ),
              );
            } else {
              BlocProvider.of<BrewsBloc>(context).add(const BrewsBlocEvent());
              return Container();
            }
          },
        ));
  }
}
