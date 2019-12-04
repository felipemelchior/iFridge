import 'package:flutter/material.dart';
import 'package:ifridge/widgets/generate_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenerateIngredients extends StatelessWidget {
  final List<String> ingredients;
  final List<String> icons;
  final List<bool> promotion;
  GenerateIngredients(this.ingredients, this.icons, this.promotion);

  @override
  Widget build(BuildContext contex) {
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
              title: 
              Row(children: <Widget>[
                Text(ingredients[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('\t\t'),
                (promotion[index])
                ? Icon(FontAwesomeIcons.tags, color: Colors.red,)
                : Icon(FontAwesomeIcons.tags, color: Colors.black12,)
              ],),
              // trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              //   print(ingredients[index]);
              // }),
              trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
                print(ingredients[index]);
              }),
            ),
          );
        },
    );
  }
}

class Market extends StatefulWidget {
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  List<String> ingredients = ['carrot', 'chicken'];
  List<String> icons = [
    'https://www.iowdonkeysanctuary.org/wp-content/uploads/2019/10/Crazy-Carrot.jpg',
    'https://i.ytimg.com/vi/Hq2pavmew58/maxresdefault.jpg'
  ];
  List<bool> promotion = [true, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
            body: SingleChildScrollView(
          child: new Column(children: [
            GenerateText('Buy products', 22),
            SizedBox(height: 15),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.red[200],
                    thickness: 2,
                  ),
                ),
                Icon(Icons.shopping_cart, color: Colors.red[200],),
                Expanded(
                  child: Divider(
                    color: Colors.red[200],
                    thickness: 2,
                  ),
                ),
              ],
            ),
            new GenerateIngredients(ingredients, icons, promotion),
          ]),
        )));
  }
}
