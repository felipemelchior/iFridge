import 'package:flutter/material.dart';
import 'package:ifridge/tabs/fridge_tab.dart';
import 'package:ifridge/tabs/home_tab.dart';
import 'package:ifridge/widgets/custom_drawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ifridge/screens/market_screen.dart';

class HomeScreen extends StatefulWidget {
  var responseData;
  @override
  _HomeScreenState createState() => _HomeScreenState();
  HomeScreen(responseData);
}

class _HomeScreenState extends State<HomeScreen> {
  
  final _pageController = PageController();
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }

  void initState() {
    super.initState();
    initializeNotifications();
    DateTime now = DateTime.now().toUtc().add(
          Duration(seconds: 5),
        );
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
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              textAlign: TextAlign.center,
            ),
          ),
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text("Recipes"),
        //     centerTitle: true,
        //   ),
        //   drawer: CustomDrawer(_pageController),
        //   body: Recipe(),
        // ),
        Scaffold(
          appBar: AppBar(
            title: Text("Fridge"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Fridge(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Market"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Market(),
        ),
      ],
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   final _pageController = PageController();
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _pageController,
//       physics: NeverScrollableScrollPhysics(),
//       children: <Widget>[
//         Scaffold(
//           appBar: AppBar(
//             title: Text(
//               "Home",
//               textAlign: TextAlign.center,
//             ),
//           ),
//           body: HomeTab(),
//           drawer: CustomDrawer(_pageController),
//         ),
//         // Scaffold(
//         //   appBar: AppBar(
//         //     title: Text("Recipes"),
//         //     centerTitle: true,
//         //   ),
//         //   drawer: CustomDrawer(_pageController),
//         //   body: Recipe(),
//         // ),
//         Scaffold(
//           appBar: AppBar(
//             title: Text("Fridge"),
//             centerTitle: true,
//           ),
//           drawer: CustomDrawer(_pageController),
//           body: Fridge(),
//         ),
//       ],
//     );
//   }
// }
