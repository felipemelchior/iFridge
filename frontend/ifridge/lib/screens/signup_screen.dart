import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    final _formKey = GlobalKey<FormState>();

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
                  child: Text(
                    "iFridge",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(120),
                ),
                Container(
                    width: ScreenUtil.getInstance().setWidth(700),
                    height: ScreenUtil.getInstance().setHeight(790),
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
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Cadastre-se!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(70),
                                    fontFamily: "Merriweather",
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          blurRadius: 6,
                                          color: Colors.black87,
                                          offset: Offset(2, 2)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 40,
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    top: 4,
                                    right: 12,
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
                                    validator: (text) {
                                      if (text.isEmpty || text.contains("@"))
                                        return "E-mail inválido";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.email),
                                      hintText: "E-mail",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 40,
                                  padding: EdgeInsets.only(
                                    left: 12,
                                    top: 4,
                                    right: 12,
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
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (text) {
                                      if (text.isEmpty || text.length < 6)
                                        return "Senha inválida";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.vpn_lock),
                                      hintText: "Senha",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: FlatButton.icon(
                                    color: Colors.red,
                                    icon: Icon(
                                      Icons.exit_to_app,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Cadastrar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(40),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {}
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
