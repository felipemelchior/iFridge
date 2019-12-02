import 'package:flutter/material.dart';

// import 'screens/new_login_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'iFridge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color.fromARGB(255, 255, 0, 0),
        
      ),
      home: HomeScreen(),
  
    );
  }
}
