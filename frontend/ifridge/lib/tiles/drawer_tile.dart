import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String screenName;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.screenName, this.controller, this.page);
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 32,
              ),
              Icon(
                icon,
                size: 32,
                color: controller.page.round() == page
                    ? Colors.white
                    : Colors.black,
              ),
              SizedBox(
                width: 32,
              ),
              Text(
                screenName,
                style: TextStyle(
                  fontSize: 16,
                  color: controller.page.round() == page
                      ? Colors.white
                      : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
