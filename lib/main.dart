import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Himanshu Shrama | Portfolio',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}