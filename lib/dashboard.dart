import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_inex.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/screen/home.dart';
import 'package:my_portfolio/screen/navbar.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/screen/social.dart';
import 'package:my_portfolio/utilities/pageIndicator.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:provider/provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    controller=PageController( initialPage: Provider.of<CurrentPage>(context, listen: false).currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    menuController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider.value(
      value: menuController,
      child: Scaffold(
        backgroundColor: ProfileTheme.color7,
        body: Center(
          child: (ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
          ? Container(
            height: height - 10,
            width: width - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ProfileTheme.backgroundColor
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                DesktopWidget(controller: controller,currentIndex: currentIndex), 
                Align(
                  alignment: Alignment.centerLeft,
                  child: Navbar(controller: controller,currentIndex: currentIndex)
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SocialWidget(
                    pageController: controller
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, right: 25),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: PageIndicator(
                        pageController: controller,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
          : MobileWidget(),
        )
      ),
    );
  }
}