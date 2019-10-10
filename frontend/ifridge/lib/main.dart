import 'package:flutter/material.dart';
import 'package:ifridge/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App de Comida',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginScreen(),
    );
  }
}
