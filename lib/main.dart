import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  var index = 2;
  final items = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
    Icon(Icons.ac_unit, size: 30),
    Icon(Icons.access_alarm, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '$index',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 120,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Curved Navigation Bar'),
          elevation: 0,
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.grey,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            buttonBackgroundColor: Colors.yellow[700],
            backgroundColor: Colors.transparent,
            height: 50,
            items: items,
            index: index,
            onTap: (index) {
              setState(() {
                this.index = index;
              });
              //Handle button tap
            },
          ),
        ),
      ),
    );
  }
}
