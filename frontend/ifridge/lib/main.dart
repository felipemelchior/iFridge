import 'package:flutter/material.dart';
import 'package:ifridge/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'screens/new_login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'iFridge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red,
          // primaryColor: Color.fromARGB(255, 255, 0, 0),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
