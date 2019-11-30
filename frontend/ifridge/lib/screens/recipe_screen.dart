import 'package:flutter/material.dart';
import 'package:ifridge/widgets/generate_list.dart';
import 'package:ifridge/widgets/generate_text.dart';


class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  List<String> ingredients = ['3x Frangos inteiros', '1x Farinha', '1x litro de óleo'];
  List<String> steps = ['Empane o frango', 'Jogue no óleo quente', 'Aproveite o frango'];
  List<int> icons_ingredients = [0,1,2];
  List<int> icons_steps = [0,0,0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(title: Text('Receita')),
            body: new Column(children: [
              new Texto('Frango frito', 28),
              new ClipRRect(
                borderRadius: new BorderRadius.circular(30.0),
                child: Image.network(
                  'https://www.jessicagavin.com/wp-content/uploads/2014/01/buttermilk-fried-chicken-11-1200-150x150.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
              ),
              new Texto('Ingredientes necessários', 18),
              new Expanded(child: new Lista(ingredients, icons_ingredients)),
              new Texto('Modo de preparo', 18),
              new Expanded(child: new Lista(steps, icons_steps)),
            ])));
  }
}