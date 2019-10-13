import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(750),
                  height: ScreenUtil.getInstance().setHeight(220),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 15.0),
                          blurRadius: 15.0),
                    ],
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  // child: Container(
                  //   height: 150,
                  //   alignment: Alignment.center,
                  child: Text(
                    "iFridge",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil.getInstance().setSp(70),
                      fontFamily: "Merriweather",
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
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(120),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(700),
                  height: ScreenUtil.getInstance().setHeight(680),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 15.0),
                          blurRadius: 15.0),
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Entre!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: ScreenUtil.getInstance().setSp(55),
                                fontFamily: "Merriweather",
                                letterSpacing: .6)),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.only(
                            bottom: 10,
                          ),
                          alignment: Alignment.center,
                          child: RaisedButton(
                            color: Colors.white70,
                            child: Text(
                              "Logar com Facebook",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Merriweather",
                                fontSize: ScreenUtil.getInstance().setSp(40),
                                color: Color(0xFF3b5998),
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
                                fontSize: ScreenUtil.getInstance().setSp(30),
                                fontFamily: "Merriweather",
                              ),
                            ),
                            Expanded(
                              child: Divider(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
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
                                fontSize: ScreenUtil.getInstance().setSp(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
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
                                fontSize: ScreenUtil.getInstance().setSp(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: ScreenUtil.getInstance().setHeight(70),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlatButton.icon(
                                  color: Colors.red,
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Entrar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(40),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(35),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "Esqueceu sua senha?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Merriweather",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 35,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Novo por aqui? ",
                        style: TextStyle(
                          fontFamily: "Merriweather",
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Cadastre-se!",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Merriweather",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
