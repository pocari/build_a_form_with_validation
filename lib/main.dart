import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello, world',
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello, world'),
        ),
        body: Center(
          child: Text('hello, world'),
        ),
      ),
    );
  }
}
