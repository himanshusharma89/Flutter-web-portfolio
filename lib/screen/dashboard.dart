import 'package:flutter/material.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:my_portfolio/screen/navbar.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ItemScrollController controller;
  bool darkmode;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    setState(() {
      darkmode=true;
    });
    super.initState();
    controller=ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkmode? ProfileTheme.backgroundColor: Colors.white
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: (ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
        ? Stack(
          children: <Widget>[
            Home(controller: controller,darkmode: true,drawerkey: _drawerKey),
            Navbar(controller: controller,darkmode: true,),
          ],
        )
        : Stack(
          children: <Widget>[
            Home(controller: controller,darkmode: true,drawerkey: _drawerKey),
          ],
        )
      ),
    );
  }
}