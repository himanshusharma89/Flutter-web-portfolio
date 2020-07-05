import 'package:flutter/material.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/navbar.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController controller;
  bool darkmode;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int currentIndex=0;

  @override
  void initState() {
    setState(() {
      darkmode=true;
    });
    super.initState();
    controller=PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkmode? ProfileTheme.backgroundColor: Colors.white,
      body: (ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
      ? Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Navbar(controller: controller,darkmode: true,currentIndex: currentIndex),
            Home(controller: controller,darkmode: true,drawerkey: _drawerKey,currentIndex: currentIndex), 
          ],
        ),
      )
      : Home(controller: controller,darkmode: true,drawerkey: _drawerKey)
    );
  }
}