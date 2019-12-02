import 'package:flutter/material.dart';
import 'package:ifridge/widgets/generate_list.dart';

class Fridge extends StatefulWidget {
  @override
  _FridgeState createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  List<String> ingredients = ['1x Whole chicken', '1x Flour', '1x Liter of oil'];
  List<String> icons_ingredients = ['https://i.ytimg.com/vi/Hq2pavmew58/maxresdefault.jpg','https://assets.xtechcommerce.com/uploads/images/medium/73750f362e4bb6daa20ecf0bf427e74a.jpeg','https://s3.portalt5.com.br/imagens/oleos.jpg?mtime=20180212121934'];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
          // appBar: AppBar(title: Text('Geladeira')),
          body: Column(children: <Widget>[Expanded(child: Lista(ingredients, icons_ingredients))]),
        ));
  }
}
