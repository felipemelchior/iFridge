import 'package:flutter/material.dart';
import 'package:ifridge/screens/recipe_screen.dart';
import 'package:ifridge/tabs/fridge_tab.dart';
import 'package:ifridge/tabs/home_tab.dart';
import 'package:ifridge/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
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
      ],
    );
  }
}
