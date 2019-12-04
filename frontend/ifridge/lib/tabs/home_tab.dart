import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }
  String _search;
  int _offset = 0;

  Future<Map> _getSearch() async {
    http.Response response;

    if (_search == null || _search.isEmpty)
      response = await http.get(
          "https://api.spoonacular.com/recipes/random?apiKey=qualquermerda&number=20");
    else
      response = await http.get(
          "https://api.spoonacular.com/recipes/complexSearch?apiKey=qualquermerda&query=$_search&includeIngredients?$_search&number=20&offset=$_offset");

    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    _getSearch().then((map) {
      print(map);
    });
    startNotification();
  }
  
  startNotification() async {
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    DateTime now = DateTime.now().toUtc().add(
          Duration(seconds: 10),
        );
    await singleNotification(
      now,
      "Notification",
      "This is a notification",
      98123871,
    );
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
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

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            onSubmitted: (text) {
              setState(() {
                _search = text;
                _offset = 0;
              });
            },
            decoration: InputDecoration(
              labelText: "Search!",
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: _getSearch(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 5.0,
                    ),
                  );
                default:
                  if (snapshot.hasError)
                    return Container();
                  else if (_search != null)
                    return _createSearchTable(context, snapshot);
                  else
                    return _createRandomTable(context, snapshot);
              }
            },
          ),
        ),
      ],
    );
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createSearchTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      itemCount: _getCount(snapshot.data["results"]),
      itemBuilder: (context, index) {
        if (index < snapshot.data["results"].length) {
          return GestureDetector(
            child: Column(
              children: <Widget>[
                Text(
                  snapshot.data["results"][index]["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Expanded(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: snapshot.data["results"][index]["image"],
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            onTap: () {
              print("RecipeScreen");
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             RecipePage2(snapshot.data["recipes"][index])));
            },
            onLongPress: () {
            },
          );
        } else {
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.black, size: 70),
                  Text(
                    "Carregar mais...",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  _offset += 19;
                });
              },
            ),
          );
        }
      },
    );
  }

  Widget _createRandomTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      itemCount: _getCount(snapshot.data["recipes"]),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Column(
            children: <Widget>[
              Text(
                snapshot.data["recipes"][index]["title"],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Expanded(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data["recipes"][index]["image"],
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          onTap: () {
            print("RecipeScreen");
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             RecipePage2(snapshot.data["recipes"][index])));
          },
          onLongPress: () {
          },
        );
      },
    );
  }
}
