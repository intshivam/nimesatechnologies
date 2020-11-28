import 'package:flutter/material.dart';
import 'package:nisema_project/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'London Location',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
