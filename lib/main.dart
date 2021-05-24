import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String displayEx0h = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: _tapped,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[500])),
                child: Center(
                  child: Text(
                    displayEx0h,
                    style: TextStyle(color: Colors.white70, fontSize: 36),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tapped() {
    setState(() {
      displayEx0h = 'o';
    });
  }
}
