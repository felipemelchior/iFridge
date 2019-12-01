import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
// import 'package:ifridge/widgets/login_form_card.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ingredientes extends StatelessWidget {
  List<String> _ingredientes = ['3x frango', '2x batata', '5x Pimenta'];

  final icons = [
    Icon(FontAwesomeIcons.hamburger),
    Icon(FontAwesomeIcons.gamepad),
    Icon(FontAwesomeIcons.bacon)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // separatorBuilder: (context, index) => Divider(
      //   color: Colors.black,
      // ),
      itemCount: _ingredientes.length,
      // itemBuilder: (context, index) => Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: Center(child: Text(_ingredientes[index])),
      // ),
      itemBuilder: (context, index) {
        return Card(
          //                           <-- Card widget
          child: ListTile(
            leading: icons[index],
            // leading: new CircleAvatar(
            //   backgroundColor: Colors.white,
            //   child: new Image(image: new AssetImage('assets/frango.jpg')),
            // ),
            title: Text(_ingredientes[index]),
          ),
        );
      },
    );
  }
}

class Fridge extends StatefulWidget {
  @override
  _FridgeState createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
          // appBar: AppBar(title: Text('Geladeira')),
          body: Column(children: <Widget>[Expanded(child: Ingredientes())]),
        ));
  }
}

class ShapeCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
