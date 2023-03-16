import 'package:flutter/material.dart';
import 'package:prueba_tecnica_adrian_carneiro_diz/data/models/brew.dart';

class BrewCell extends StatelessWidget {
   BrewCell({super.key, required this.brew});

  Brew brew;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 16,
      height: MediaQuery.of(context).size.height/5,
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(8),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shadowColor: const Color.fromARGB(255, 255, 211, 123),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  brew.image_url!.isNotEmpty ? SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Image.network(brew.image_url ?? '',
                    fit: BoxFit.fitHeight,)) 
                  : Container(),
                  Text(brew.name ?? ''),
                ],
              )
            ),
            onTap: () {
              
            },
          ),
        ),
      ),
    );
  }
}
