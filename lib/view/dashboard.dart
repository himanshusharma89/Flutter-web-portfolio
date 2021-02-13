import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/view/screens/home/desktop.dart';
import 'package:my_portfolio/view/screens/home/mobile.dart';
import 'package:my_portfolio/view/navbar.dart';
import 'package:my_portfolio/widgets/social.dart';
import 'package:my_portfolio/helpers/page_indicator.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  PageController desktopController, mobileController;
  MenuController menuController;

  @override
  void initState() {
    super.initState();
    menuController = MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    desktopController = PageController(
        initialPage:
            Provider.of<CurrentPage>(context, listen: false).currentPage);
    mobileController = PageController(
        initialPage:
            Provider.of<CurrentPage>(context, listen: false).currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    menuController.dispose();
    desktopController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuController>.value(
      value: menuController,
      child: Scaffold(
          body: ResponsiveLayout.isSmallScreen(context)
              ? MobileWidget(controller: mobileController)
              : Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    DesktopWidget(controller: desktopController),
                    navBarWidget(),
                    socialWidget(),
                    pageIndicator()
                  ],
                )),
    );
  }

  Widget navBarWidget() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Navbar(controller: desktopController));
  }

  Widget socialWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: SocialWidget(),
    );
  }

  Widget pageIndicator() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 100, right: 25),
        child: RotatedBox(
          quarterTurns: 1,
          child: PageIndicator(
            pageController: desktopController,
          ),
        ),
      ),
    );
  }
}
