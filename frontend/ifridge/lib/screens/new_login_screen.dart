import 'package:flutter/material.dart';
import 'package:ifridge/widgets/login_form_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                LoginFormCard(),
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
