import 'package:flutter/material.dart';
import 'package:ifridge/models/user_model.dart';
import 'package:ifridge/widgets/login_form_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifridge/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    bool _rememberMeFlag = false;
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
                    child: ScopedModelDescendant<UserModel>(
                      builder: (context, child, model) {
                        if (model.isLoading)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        return Form(
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
                                      "Entre!",
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
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (text) {
                                          if (text.isEmpty ||
                                              text.contains("@"))
                                            return "E-mail inválido";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(Icons.email),
                                          hintText: "E-mail",
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                    GestureDetector(
                                      child: Row(
                                        children: <Widget>[
                                          Checkbox(
                                            value: _rememberMeFlag,
                                            onChanged: (value) => setState(() {
                                              _rememberMeFlag =
                                                  !_rememberMeFlag;
                                            }),
                                          ),
                                          Text(
                                            "Lembrar-me",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                      onTap: () => setState(() {
                                        _rememberMeFlag = !_rememberMeFlag;
                                      }),
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
                                          "Entrar",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(40),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {}
                                              model.signIn();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Divider(),
                                        ),
                                        Text(
                                          "OU",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(30),
                                            fontFamily: "Merriweather",
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(),
                                        ),
                                      ],
                                    ),
                                    Center(
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
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 35),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Novo por aqui? ",
                                            style: TextStyle(
                                              fontFamily: "Merriweather",
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SignUpScreen()));
                                            },
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
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
