import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/dashboard.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/provider/article_provider.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CurrentPage>(create: (context) => CurrentPage()),
      ChangeNotifierProvider<ArticleProvider>(
          create: (context) => ArticleProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Himanshu Shrama | Flutter Dev',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: ProfileTheme.backgroundColor),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        initialRoute: '/main',
        routes: {
          '/main': (context) => Dashboard(),
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
