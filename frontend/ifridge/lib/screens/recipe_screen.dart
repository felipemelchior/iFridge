import 'package:flutter/material.dart';
import 'package:ifridge/widgets/generate_list.dart';
import 'package:ifridge/widgets/generate_text.dart';


class Recipe extends StatefulWidget {
  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  List<String> ingredients = ['1x Whole chicken', '1x Flour', '1x Liter of oil'];
  List<String> steps = ['Bread the chicken gently', 'Throw it up and get the pan with the hot oil', 'Enjoy the chicken'];
  List<String> icons_ingredients = ['https://i.ytimg.com/vi/Hq2pavmew58/maxresdefault.jpg','https://assets.xtechcommerce.com/uploads/images/medium/73750f362e4bb6daa20ecf0bf427e74a.jpeg','https://s3.portalt5.com.br/imagens/oleos.jpg?mtime=20180212121934'];
  List<String> icons_steps = ['https://cdn.shopify.com/s/files/1/2131/5111/products/red-mobile-1.jpg?v=1571156791', 'https://cdn.shopify.com/s/files/1/2131/5111/products/red-mobile-1.jpg?v=1571156791', 'https://cdn.shopify.com/s/files/1/2131/5111/products/red-mobile-1.jpg?v=1571156791'];
  String title = 'Fried chicken';
  String profile = 'https://www.jessicagavin.com/wp-content/uploads/2014/01/buttermilk-fried-chicken-11-1200-150x150.jpg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: 
          Scaffold(
            appBar: AppBar(title: Text('Recipe')),
            body: new Column(children: [
              new Texto(title, 22),
              new ClipRRect(
                borderRadius: new BorderRadius.circular(30.0),
                child: Image.network(
                  profile,
                  height: 110.0,
                  width: 110.0,
                ),
              ),
              new Texto('Required Ingredients', 18),
              new Expanded(child: new Lista(ingredients, icons_ingredients)),
              new Texto('Method of preparation', 18),
              new Expanded(child: new Lista(steps, icons_steps)),
            ])
          )
        );
  }
}