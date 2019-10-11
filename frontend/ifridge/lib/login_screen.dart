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
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height/3,
                // height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.redAccent,
                      Colors.red,
                      Colors.deepOrangeAccent,
                      Colors.orangeAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: SizedBox(
                  height: 150,
                  width: 10,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "iFridge",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        fontFamily: "Merriweather",
                        // color: Colors.orangeAccent,
                        color: Colors.white,  
                        shadows: [
                          Shadow(
                              blurRadius: 1,
                              color: Colors.black38,
                              offset: Offset(2, 2)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(
                  top: 60,
                  left: 40,
                  right: 40,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        // color: Color(0xFF3b5998),
                        color: Colors.white70,
                        child: Text(
                          "Logar com Facebook",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Merriweather",
                            fontSize: 20,
                            color: Color(0xFF3b5998),
                            // foreground: Paint()
                            //   ..style = PaintingStyle.stroke
                            //   ..strokeWidth = 2
                            //   ..color = Color(0xFF3b5998),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 40,
                      padding: EdgeInsets.only(
                        left: 12,
                        top: 4,
                        right: 12,
                        bottom: 4,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 3,
                            ),
                          ]),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.email),
                          hintText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 40,
                      padding: EdgeInsets.only(
                        left: 12,
                        top: 4,
                        right: 12,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 3,
                            ),
                          ]),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.vpn_lock),
                          hintText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(
                            // begin: Alignment.centerLeft,
                            // end: Alignment.centerRight,
                            colors: [
                              Colors.redAccent,
                              Colors.red,
                              Colors.deepOrangeAccent,
                              Colors.orangeAccent,
                              Colors.red,
                              Colors.redAccent,
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                  blurRadius: 1,
                                  color: Colors.black38,
                                  offset: Offset(2, 2)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Ainda não é cadastrado?",
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
      ),
    );
  }
}

// Classe para desenhar o container
class ShapeCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // paint.color = Colors.deepPurple;
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
