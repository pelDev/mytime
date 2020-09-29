import 'package:flutter/material.dart';
import 'package:mytime/screens/home.dart';

void main() {
  runApp(MyTime());
}

class MyTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Time',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: MyTimeHome(),
    );
  }
}
