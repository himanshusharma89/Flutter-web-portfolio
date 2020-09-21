import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/home/home.dart';
import 'package:my_portfolio/navbar.dart';
import 'package:my_portfolio/home/social.dart';
import 'package:my_portfolio/utilities/pageIndicator.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  PageController desktopController;
  PageController mobileController;
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
    mobileController = PageController();
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
    return ChangeNotifierProvider.value(
      value: menuController,
      child: Scaffold(
          body: Center(
        child: (ResponsiveLayout.isLargeScreen(context) ||
                ResponsiveLayout.isMediumScreen(context))
            ? Stack(
              fit: StackFit.expand,
              children: <Widget>[
                DesktopWidget(controller: desktopController),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Navbar(controller: desktopController)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SocialWidget(),
                ),
                Align(
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
                )
              ],
            )
            : MobileWidget(controller: mobileController),
      )),
    );
  }
}
