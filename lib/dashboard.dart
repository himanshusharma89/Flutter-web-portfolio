import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:my_portfolio/screen/navbar.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  PageController controller;
  MenuController menuController;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    menuController = MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    controller=PageController();
  }

  @override
  void dispose() {
    super.dispose();
    menuController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: menuController,
      child: Scaffold(
        backgroundColor: ProfileTheme.backgroundColor,
        body: (ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
        ? Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              DesktopWidget(controller: controller,currentIndex: currentIndex), 
              Align(
                alignment: Alignment.centerLeft,
                child: Navbar(controller: controller,currentIndex: currentIndex)
              ),
            ],
          ),
        )
        : MobileWidget()
      ),
    );
  }
}