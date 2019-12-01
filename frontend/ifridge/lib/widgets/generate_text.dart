import 'package:flutter/material.dart';


class GenerateText extends StatelessWidget {
  final String title;
  final double size;
  GenerateText(this.title, this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.only(
      left: 0,
      top: 10,
      right: 0,
      bottom: 0,
    ),
    child: Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      )),
    );
  }
}