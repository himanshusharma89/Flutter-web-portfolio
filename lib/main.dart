import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/dashboard.dart';
import 'package:my_portfolio/profile_colors.dart';
import 'package:my_portfolio/provider/article_provider.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:my_portfolio/provider/project_provider.dart';
import 'package:provider/provider.dart';

import 'helpers/launcher.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CurrentPage>(create: (context) => CurrentPage()),
      ChangeNotifierProvider<ArticleProvider>(
          create: (context) => ArticleProvider()),
      ChangeNotifierProvider<ExperienceProvider>(
          create: (context) => ExperienceProvider()),
      ChangeNotifierProvider<ProjectProvider>(
          create: (context) => ProjectProvider())
    ],
    child: MyApp(),
  ));
}

final Launcher launcher = Launcher();

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
            scaffoldBackgroundColor: ProfileColors.backgroundColor),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        initialRoute: '/',
        routes: {
          '/': (context) => Dashboard(),
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
