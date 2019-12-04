import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ifridge/widgets/generate_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenerateIngredients extends StatelessWidget {
  final List<String> ingredients = List();
  final List<bool> promotion = List();
  final List<double> prices = List();
  final List<String> owners = List();
  final List<dynamic> data;
  GenerateIngredients(this.data);

  _prepareData(){
    for(var i in this.data){
      this.ingredients.add(i['name']);
      this.promotion.add(i['promo_activated']);
      if(i['promo_activated']){
        this.prices.add(i['promo_price'].toDouble());
      }
      else{
        this.prices.add(i['price'].toDouble());
      }
      this.owners.add(i['User']['name']);
    }
  }

  @override
  Widget build(BuildContext contex) {
    _prepareData();
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
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
                //  icons[index]
                 'https://spoonacular.com/cdn/ingredients_100x100/${ingredients[index].toLowerCase()}.jpg'
                ) // no matter how big it is, it won't overflow
              ),
              title:Text(ingredients[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              subtitle: 
              Column(children: <Widget>[
                Row(children: <Widget>[
                  (promotion[index])
                  ? Icon(FontAwesomeIcons.tags, color: Colors.red, size: 14,)
                  : Icon(FontAwesomeIcons.tags, color: Colors.black12, size: 14,),
                  Text('\t\t\$'+prices[index].toString()+'\t'),
                ],),
                Row(children: <Widget>[
                  Text(this.owners[index])
                ]),
              ],),
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
  List<String> ingredients = ['salt', 'carrot', 'celery'];
  List<bool> promotion = [false, true, false];
  List<double> prices = [0.45, 0.70, 0.20];

  Future<List<dynamic>> _getIngredients() async {
    http.Response response;

    response = await http.get('http://192.168.0.102:9091/products');
    return json.decode(response.body);
  }

  void initState() {
    super.initState();

    _getIngredients().then((map) {
      print(map);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
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
            GenerateText('Buy products', 22),
            Divider(color: Colors.red[200], thickness: 2,),
            Expanded(
              child: FutureBuilder(
                future: _getIngredients(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return GenerateIngredients(snapshot.data);
                  }
                },
              ),
            ),
          ])
        
      
    ;
  }
}