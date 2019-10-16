import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormCard extends StatefulWidget {
  @override
  _LoginFormCardState createState() => _LoginFormCardState();
}

class _LoginFormCardState extends State<LoginFormCard> {
  bool _rememberMeFlag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Entre!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getInstance().setSp(70),
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
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
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
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
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
              height: ScreenUtil.getInstance().setHeight(10),
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _rememberMeFlag,
                    onChanged: (value) => setState(() {
                      _rememberMeFlag = !_rememberMeFlag;
                    }),
                  ),
                  Text(
                    "Lembrar-me",
                    style: TextStyle(color: Colors.black),
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
                    fontSize: ScreenUtil.getInstance().setSp(40),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(10),
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
                    fontSize: ScreenUtil.getInstance().setSp(30),
                    fontFamily: "Merriweather",
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              alignment: Alignment.center,
              child: FlatButton(
                color: Colors.white,
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
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
          ],
        ),
      ),
    );
  }
}
