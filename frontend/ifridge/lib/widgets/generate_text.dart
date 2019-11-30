import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  final String title;
  final double size;
  Texto(this.title, this.size);
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(8.0),
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