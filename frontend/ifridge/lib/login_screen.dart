import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.pink, Colors.blueGrey],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child:Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height/3,
                  height: 180,
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     colors: [
                  //       Color(0xFFf45d27),
                  //       Color(0xFFf5851f),
                  //     ],
                  //   ),
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(50),
                  //     bottomRight: Radius.circular(50),
                  //   ),
                  // ),
                  child: CustomPaint(
                    painter: ShapeCurvo(),
                    child: SizedBox(
                      height: 100,
                      width: 130,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "iFridge",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            fontFamily: "Merriweather",
                            foreground: Paint()..shader = linearGradient,
                            shadows: [
                              Shadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset(3, 3)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 40,
                    right: 40,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          bottom: 30,
                        ),
                        alignment: Alignment.center,
                        child: RaisedButton(
                          color: Colors.grey,
                          child: Text(
                            "Logar com Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Merriweather",
                              color: Colors.black,
                              // shadows: [
                              //   Shadow(
                              //       blurRadius: 2,
                              //       color: Colors.black,
                              //       offset: Offset(3, 3)),
                              // ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(),
                          ),
                          Text(
                            "Ou",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              fontFamily: "Merriweather",
                            ),
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          // labelText: "E-mail",
                          hintText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          // labelText: "Senha",
                          hintText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
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
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(4)),
                          onPressed: () {},
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text("Ainda não é cadastrado?",
                                    textAlign: TextAlign.center,
                                  ),                                
                          ),
                          Container(
                            // height: 20,
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              child: Text(
                                "Clique aqui!",
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(
                                right: 50,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class ShapeCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.deepPurple;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.50);
    path.quadraticBezierTo(
        size.width, size.height, size.width / 1.5, size.height / 1.5);
    // path.lineTo(size.width/2, size.height/2);
    path.quadraticBezierTo(
        size.width / 2.5, size.height / 3, size.width, size.height * 0.80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
