import 'package:flutter/material.dart';
import 'package:ifridge/widgets/generate_list.dart';
import 'package:ifridge/widgets/generate_text.dart';

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
    'https://cdn.shopify.com/s/files/1/2131/5111/products/red-mobile-1.jpg?v=1571156791',
    'https://cdn.shopify.com/s/files/1/2131/5111/products/red-mobile-1.jpg?v=1571156791',
    'https://cdn.shopify.com/s/files/1/2131/5111/products/red-mobile-1.jpg?v=1571156791'
  ];
  String title = 'Fried chicken';
  String profile =
      'https://www.jessicagavin.com/wp-content/uploads/2014/01/buttermilk-fried-chicken-11-1200-150x150.jpg';

  void _prepareList() {
    //  for ingredient in this._recipeData[]
    this.profile = this._recipeData["image"];
    this.title = this._recipeData["title"];
    this.ingredients = List();
    this.icons_ingredients = List();
    this.steps = List();
    this.icons_steps = List();

    print(this.icons_ingredients.runtimeType);

    for(var i in this._recipeData['extendedIngredients']){
      this.ingredients.add(i["original"].toString());
      this.icons_ingredients.add('https://spoonacular.com/cdn/ingredients_100x100/'+i['image']);
    }

    for(var i in this._recipeData['analyzedInstructions']){
      for(var j in i['steps']){
        this.steps.add(j['step']);
        this.icons_steps.add(profile);
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
