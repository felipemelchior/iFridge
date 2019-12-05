import 'package:flutter/material.dart';
import 'package:ifridge/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ifridge/screens/home_screen.dart';
import 'package:ifridge/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var responseData;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    bool _rememberMeFlag = false;

    return new Scaffold(
      key: _scaffoldKey,
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
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (text) {
                                          if (text.isEmpty ||
                                              !text.contains("@"))
                                            return "Invalid email";
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
                                        controller: _passwordController,
                                        textAlign: TextAlign.left,
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (text) {
                                          if (text.isEmpty || text.length < 6)
                                            return "Invalid password";
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(Icons.vpn_lock),
                                          hintText: "Password",
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
                                    Container(
                                      alignment: Alignment.center,
                                      child: FlatButton.icon(
                                        color: Colors.red,
                                        icon: Icon(
                                          Icons.exit_to_app,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          "Sign In",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(40),
                                          ),
                                        ),
                                        onPressed: () async {
                                          // if (_formKey.currentState
                                          //     .validate()) {}
                                          Map<String, dynamic> userData = {
                                            "email": _emailController.text,
                                            "password":
                                                _passwordController.text,
                                          };
                                          var response = await
                                          model.signIn(
                                              userData, _onSuccess, _onFail);

                                              // print(response['token']);
                                              // print(response['user']['name']);
                                          // response = json.encode(response);
                                          // Map myMap = json.decode(response);
                                          // myMap = json.decode(myMap['token']);

                                          // print(myMap['token']);
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
                                          "Forgot your password?",
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
                                            "New here? ",
                                            style: TextStyle(
                                              fontFamily: "Merriweather",
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // Navigator.of(context)
                                              //     .pushReplacement(
                                              //         MaterialPageRoute(
                                              //             builder: (context) =>
                                              //                 SignUpScreen()));
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUpScreen()));
                                            },
                                            child: Text(
                                              "Sign Up!",
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

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Logged in!"),
      backgroundColor: Colors.greenAccent,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Login fail!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
