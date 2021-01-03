import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Hanoi towers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hanoi Towers'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: CustomPaint(
                      painter: MyCustomPainter(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {

  double columnX(int columnNumber, double width) {
    return (columnNumber * 2.0 - 1.0) * width / 6.0;
  }

  @override
  void paint(Canvas canvas, Size size) {

    var towerThickness = 8.0;

    var paint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 4;

    canvas.drawRect(
        Rect.fromPoints(
            Offset(0, 0),
            Offset(size.width, size.height)),
        paint);

    var paint2 = Paint()
      ..color = Colors.yellow
      ..strokeWidth = towerThickness;

    var x1 = columnX(1, size.width);
    canvas.drawLine(
        Offset(x1, 10),
        Offset(x1, size.height - 10),
        paint2
    );

    var x2 = columnX(2, size.width);
    canvas.drawLine(
        Offset(x2, 10),
        Offset(x2, size.height - 10),
        paint2
    );

    var x3 = columnX(3, size.width);
    canvas.drawLine(
        Offset(x3, 10),
        Offset(x3, size.height - 10),
        paint2
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}