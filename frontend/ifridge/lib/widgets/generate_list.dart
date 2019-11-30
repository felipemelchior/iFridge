import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;


class Lista extends StatelessWidget {
  final List<String> ingredients;
  final List<int> icons;
  Lista(this.ingredients, this.icons);

  final icons_design = [Icon(FontAwesomeIcons.hamburger), Icon(FontAwesomeIcons.gamepad), Icon(FontAwesomeIcons.bacon)];
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
          return Card( //                           <-- Card widget
            child: ListTile(
              leading: icons_design[icons[index]],
              title: Text(ingredients[index]),
            ),
          );
        },
    );
  }
}