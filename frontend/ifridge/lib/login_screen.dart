import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.yellow, Colors.red],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 150,
              width: 130,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                      "iFridge!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        fontFamily: "Merriweather",
                        foreground: Paint()..shader = linearGradient,
                        shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Colors.grey,
                            offset: Offset(3, 3)
                          ),
                        ],
                      ),
                    ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: RaisedButton(
                      color: Colors.deepPurpleAccent,
                      child: Text(
                        "Entrar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(4)
                      ),
                      onPressed: (){},
                    ),
                    padding: EdgeInsets.only(top: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 20,
              alignment: Alignment.center,
              child: FlatButton(
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {},
                    ),
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
