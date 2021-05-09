import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_portfolio/helpers/launcher.dart';
import 'package:my_portfolio/provider/article_provider.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:my_portfolio/provider/project_provider.dart';
import 'package:my_portfolio/views/dashboard.dart';
import 'package:provider/provider.dart';

import 'helpers/colors.dart';

final Launcher launcher = Launcher();

Future<void> main() async {
  WidgetsBinding.instance;
  await Firebase.initializeApp();
  await initializeDateFormatting();
  runApp(MultiProvider(
    providers: <ChangeNotifierProvider<ChangeNotifier>>[
      ChangeNotifierProvider<CurrentPage>(create: (_) => CurrentPage()),
      ChangeNotifierProvider<ArticleProvider>(create: (_) => ArticleProvider()),
      ChangeNotifierProvider<ExperienceProvider>(
          create: (_) => ExperienceProvider()),
      ChangeNotifierProvider<ProjectProvider>(create: (_) => ProjectProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Himanshu Sharma | Flutter Dev',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: ProfileColors.backgroundColor),
        builder: (_, Widget? child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          '/': (_) => Dashboard(),
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
