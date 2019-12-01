import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;


class Lista extends StatelessWidget {
  final List<String> ingredients;
  final List<String> icons;
  Lista(this.ingredients, this.icons);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
      ),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
          return Card( //                           <-- Card widget
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                 icons[index]
                ) // no matter how big it is, it won't overflow
              ),
              title: Text(ingredients[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )
              ),
            ),
          );
        },
    );
  }
}