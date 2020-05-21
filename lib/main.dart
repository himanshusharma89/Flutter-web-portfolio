import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/dashboard.dart';
import 'package:my_portfolio/utilities/loader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Himanshu Shrama | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      initialRoute: '/loader',
      routes: {
        '/main': (context)=>Dashboard(),
        '/loader': (context)=> Loader(),
      }
    );
  }
}