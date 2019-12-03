import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ifridge/widgets/generate_list.dart';
import 'package:ifridge/widgets/generate_text.dart';
import 'package:http/http.dart' as http;

class Recipe extends StatefulWidget {
  final Map _recipeData;

  _RecipeState createState() => _RecipeState(_recipeData);

  Recipe(this._recipeData);
}

class _RecipeState extends State<Recipe> {
  final Map _recipeData;

  _RecipeState(this._recipeData);

  List<String> ingredients = [
    '1x Whole chicken',
    '1x Flour',
    '1x Liter of oil'
  ];
  List<String> steps = [
    'Bread the chicken gently',
    'Throw it up and get the pan with the hot oil',
    'Enjoy the chicken'
  ];
  List<String> icons_ingredients = [
    'https://i.ytimg.com/vi/Hq2pavmew58/maxresdefault.jpg',
    'https://assets.xtechcommerce.com/uploads/images/medium/73750f362e4bb6daa20ecf0bf427e74a.jpeg',
    'https://s3.portalt5.com.br/imagens/oleos.jpg?mtime=20180212121934'
  ];
  List<String> icons_steps = [
    'https://image.flaticon.com/icons/png/512/53/53569.png',
    'https://image.flaticon.com/icons/png/512/53/53569.png',
    'https://image.flaticon.com/icons/png/512/53/53569.png'
  ];

  String title = 'Fried chicken';
  String profile =
      'https://www.jessicagavin.com/wp-content/uploads/2014/01/buttermilk-fried-chicken-11-1200-150x150.jpg';


  void _prepareList() {
    this.profile = this._recipeData["image"];
    this.title = this._recipeData["title"];
    this.ingredients = List();
    this.icons_ingredients = List();
    this.steps = List();
    this.icons_steps = List();
    String icon = 'https://i.pinimg.com/originals/8d/11/6a/8d116aa75e0a4e779b57682e0a92c84d.jpg';

    if(this._recipeData.keys.contains("extendedIngredients")){
      for(var i in this._recipeData['extendedIngredients']){
        this.ingredients.add(i["original"].toString());
        this.icons_ingredients.add('https://spoonacular.com/cdn/ingredients_100x100/'+i['image']);
      }
    }
    else if(this._recipeData.keys.contains("id")){
      for(var i in this._recipeData['analyzedInstructions']){
        for(var j in i['steps']){
          for(var k in j['ingredients']){
            if(!this.ingredients.contains(k["name"].toString())){
              this.ingredients.add(k["name"].toString());
              this.icons_ingredients.add('https://spoonacular.com/cdn/ingredients_100x100/'+k['image']);
            }
          }
        }
      }
    }

    for(var i in this._recipeData['analyzedInstructions']){
      for(var j in i['steps']){
        this.steps.add(j['step']);
        this.icons_steps.add(icon);
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
    // print("AAAAAA");
    // print(this._recipeData);
    _prepareList();
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
            body: SingleChildScrollView(
          child: new Column(children: [
            new SizedBox(height: 15),
            new GenerateText(title, 22),
            new ClipRRect(
              borderRadius: new BorderRadius.circular(30.0),
              child: Image.network(
                profile,
                height: 110.0,
                width: 110.0,
              ),
            ),
            new GenerateText('Required Ingredients', 18),
            new GenerateList(ingredients, icons_ingredients),
            new GenerateText('Method of preparation', 18),
            new GenerateList(steps, icons_steps),
          ]),
        )));
  }
}
