import 'package:flutter/material.dart';
import 'package:ifridge/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              // Color.fromARGB(200, 255, 68, 0),
              // Color.fromARGB(0, 255, 68, 0),
              Colors.red,
              Colors.orangeAccent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          )),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 120,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Text(
                        "iFridge, se eu cozinho\n é meu?",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Olá, Cleiton!",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
          ListView(
            padding: EdgeInsets.only(left: 0, top: 16),
            children: <Widget>[
              SizedBox(height: 120,),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Receitas", pageController, 1),
              DrawerTile(Icons.fastfood, "Geladeira", pageController, 2),
            ],
          ),
        ],
      ),
    );
  }
}
