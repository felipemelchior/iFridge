import 'package:flutter/material.dart';
import 'package:ifridge/screens/recipe_screen.dart';
import 'package:ifridge/tabs/fridge_tab.dart';
import 'package:ifridge/tabs/home_tab.dart';
import 'package:ifridge/widgets/custom_drawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ifridge/screens/market_screen.dart';

class HomeScreen extends StatefulWidget {
  var responseData;
  HomeScreen(this.responseData);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _pageController = PageController();
  void initState() {
    super.initState();
    DateTime now = DateTime.now().toUtc().add(
          Duration(seconds: 5),
        );
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
