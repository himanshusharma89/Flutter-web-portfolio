import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/drawer_controller.dart' as mc;
import 'package:my_portfolio/provider/expereince_provider.dart';
import 'package:my_portfolio/provider/project_provider.dart';
import 'package:my_portfolio/views/navbar.dart';
import 'package:my_portfolio/views/screens/home/desktop.dart';
import 'package:my_portfolio/views/screens/home/mobile.dart';
import 'package:my_portfolio/widgets/page_indicator.dart';
import 'package:my_portfolio/widgets/social.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late PageController desktopController;
  late PageController mobileController;
  late mc.MenuController menuController;

  @override
  void initState() {
    super.initState();
    Provider.of<ExperienceProvider>(context, listen: false).getExperience();
    Provider.of<ProjectProvider>(context, listen: false).getProjects();
    menuController = mc.MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    desktopController = PageController(
        initialPage:
            Provider.of<CurrentPage>(context, listen: false).currentPage,);
    mobileController = PageController(
        initialPage:
            Provider.of<CurrentPage>(context, listen: false).currentPage,);
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
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<mc.MenuController>.value(
        value: menuController,
        child: Scaffold(
          body: ResponsiveLayout(
            smallScreen: MobileWidget(controller: mobileController),
            largeScreen: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Navbar(
                    controller: desktopController,
                  ),
                ),
                Flexible(
                    flex: 10,
                    fit: FlexFit.tight,
                    child: DesktopWidget(controller: desktopController),),
                Flexible(
                  child: SizedBox(
                    width: width * 0.025 + navBarWidth(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Align(
                            alignment: Alignment.topCenter,
                            child: SocialWidget(
                              socials: socialPlatforms.sublist(0, 1),
                            ),
                          ),),
                          Expanded(
                              child: Center(
                            child: pageIndicator(desktopController,
                                axisDirection: Axis.vertical,),
                          ),),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SocialWidget(
                                    socials: socialPlatforms.sublist(1),
                                  ),),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Transform.scale(
            scale: 0.8,
            origin: const Offset(-50, 0),
            child: Visibility(
              visible: ResponsiveLayout.isLargeScreen(context) &&
                  Provider.of<CurrentPage>(context).currentPage > 0,
              child: FloatingActionButton(
                onPressed: () {
                  animateToPage(desktopController, 0);
                },
                backgroundColor: ProfileColors.dotOutlineColor,
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartFloat,
        ),);
  }
}
