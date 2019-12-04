import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:ifridge/widgets/generate_list.dart';

class Fridge extends StatefulWidget {
  // AsyncSnapshot snapshot = null;

  _FridgeState createState() => _FridgeState();
  // Fridge(AsyncSnapshot snapshot){
  //   this.snapshot = snapshot;
  // }
}

class _FridgeState extends State<Fridge> {
  TextEditingController _ingredientController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _metricController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List _ingredients = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }

  Future singleNotification(
      DateTime datetime, String message, String subtext, int hashcode,
      {String sound}) async {
    var androidChannel = AndroidNotificationDetails(
      'channel-id',
      'channel-name',
      'channel-description',
      importance: Importance.Max,
      priority: Priority.Max,
    );
    var iosChannel = IOSNotificationDetails();
    var platformChannel = NotificationDetails(androidChannel, iosChannel);
    localNotificationsPlugin.schedule(
        hashcode, message, subtext, datetime, platformChannel,
        payload: hashcode.toString());
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
        leading: Icon(
          Icons.kitchen,
          color: Colors.red,
        ),
        title: Text(
          _ingredients[index]["ingredient"] +
              " " +
              _ingredients[index]["quantity"] +
              _ingredients[index]["metric"],
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_ingredients[index]);
          _lastRemovedPos = index;
          _ingredients.removeAt(index);

          _saveData();

          final snack = SnackBar(
            content:
                Text("Ingredient \"${_lastRemoved["ingredient"]}\" removed"),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {
                setState(() {
                  _ingredients.insert(_lastRemovedPos, _lastRemoved);
                  _saveData();
                });
              },
            ),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    DateTime now = DateTime.now().toUtc().add(
          Duration(seconds: 5),
        );
    singleNotification(
      now,
      "Notification",
      "This is a notification",
      98123871,
    );
    _readData().then((data) {
      setState(() {
        _ingredients = json.decode(data);
      });
    });
  }

  void _addIngredient() {
    setState(() {
      Map<String, dynamic> newIngredient = Map();
      newIngredient["ingredient"] = _ingredientController.text;
      newIngredient["quantity"] = _quantityController.text;
      newIngredient["metric"] = _metricController.text;
      _ingredientController.text = "";
      _quantityController.text = "";
      _metricController.text = "";
      _ingredients.add(newIngredient);
      _saveData();
    });
  }

  // void _resetFields() {
  //   _ingredientController.text = "";
  //   _quantityController.text = "";
  //   _metricController.text = "";
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(
                          Icons.kitchen,
                          color: Colors.red[500],
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                        ],
                        // color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Card(
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            itemCount: _ingredients.length,
                            itemBuilder: buildItem),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _ingredientController,
                          decoration: InputDecoration(
                              hintText: "Ingredient",
                              labelStyle: TextStyle(
                                color: Colors.red,
                                // backgroundColor: Colors.black,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Type the ingredient name";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _quantityController,
                          decoration: InputDecoration(
                              hintText: "Quantity",
                              labelStyle: TextStyle(
                                color: Colors.red,
                                // backgroundColor: Colors.black,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Type the quantity";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _metricController,
                          decoration: InputDecoration(
                              hintText: "Metric",
                              labelStyle: TextStyle(
                                color: Colors.red,
                                // backgroundColor: Colors.black,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Type the metric";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40)),
                    ),
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _addIngredient();
                        }
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_ingredients);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}

// child: new Column(children: <Widget>[GenerateList(ingredients, icons_ingredients)]),

// List<String> icons_ingredients = [
//   'https://i.ytimg.com/vi/Hq2pavmew58/maxresdefault.jpg',
//   'https://assets.xtechcommerce.com/uploads/images/medium/73750f362e4bb6daa20ecf0bf427e74a.jpeg',
//   'https://s3.portalt5.com.br/imagens/oleos.jpg?mtime=20180212121934',
// ];
