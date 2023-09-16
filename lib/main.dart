import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_portfolio/firebase_options.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/launcher.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:my_portfolio/provider/project_provider.dart';
import 'package:my_portfolio/views/dashboard.dart';
import 'package:provider/provider.dart';

final Launcher launcher = Launcher();
late Uint8List unit8ListPlaceholder;
final ImageFilter imageFilter = ImageFilter.blur(sigmaX: 2.6, sigmaY: 2.6);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting();
  final bytes = await rootBundle.load('assets/placeholder.gif');
  unit8ListPlaceholder = bytes.buffer.asUint8List();
  runApp(MultiProvider(
    providers: <ChangeNotifierProvider<ChangeNotifier>>[
      ChangeNotifierProvider<CurrentPage>(create: (_) => CurrentPage()),
      ChangeNotifierProvider<ExperienceProvider>(
          create: (_) => ExperienceProvider(),),
      ChangeNotifierProvider<ProjectProvider>(create: (_) => ProjectProvider()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Himanshu Sharma | Flutter Dev',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: ProfileColors.backgroundColor,),
        builder: (_, Widget? child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          '/': (_) => const Dashboard(),
        },);
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection,) {
    return child;
  }
}
