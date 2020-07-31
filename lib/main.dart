import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/dashboard.dart';
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      // home: MyWidget(),
      initialRoute: '/loader',
      routes: {
        '/main': (context)=>Dashboard(),
        '/loader': (context)=> Loader(),
      }
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}