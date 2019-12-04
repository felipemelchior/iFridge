import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ifridge/models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(child: CircularProgressIndicator());
          return SingleChildScrollView(
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
                    height: ScreenUtil.getInstance().setHeight(1000),
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
                                  "Sign Up!",
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
                                    controller: _nameController,
                                    validator: (text) {
                                      if (text.isEmpty) return "Type your name";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.person),
                                      hintText: "Name",
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
                                    controller: _addressController,
                                    validator: (text) {
                                      if (text.isEmpty) return "Type your address";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.home),
                                      hintText: "Address",
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
                                    controller: _zipCodeController,
                                    keyboardType: TextInputType.number,
                                    validator: (text) {
                                      if (text.isEmpty) return "Type your ZipCode";
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.airport_shuttle),
                                      hintText: "Zip-Code",
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
                                    controller: _emailController,
                                    validator: (text) {
                                      if (text.isEmpty || !text.contains("@"))
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
                                    controller: _passwordController,
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
                                      "Register!",
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
                                      Map<String, dynamic> userData = {
                                        "name": _nameController.text,
                                        "email": _emailController.text,
                                        "password": _passwordController.text,
                                        "merchant": "false",
                                        "address": _addressController.text,
                                        "cep": _zipCodeController.text
                                      };
                                      // model.signUp(userData, null, null);
                                      // model.signUp(userData, _onSuccess(), onFail());
                                      model.signUp(userData, _onSuccess, _onFail);
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
                  height: ScreenUtil.getInstance().setHeight(10),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
    void _onSuccess() {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("User registered!"), backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 2),)
      );
      Future.delayed(Duration(seconds: 2 )).then((_){
      Navigator.of(context).pop();
      });
    }

    void _onFail() {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Fail registering user!"), backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),)
      );
    }
}
