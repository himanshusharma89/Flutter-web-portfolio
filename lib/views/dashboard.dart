import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/change_text_on_hover.dart';
import '../helpers/colors.dart';
import '../helpers/functions.dart';
import '../helpers/page_indicator.dart';
import '../helpers/responsive_layout.dart';
import '../provider/article_provider.dart';
import '../provider/current_index.dart';
import '../provider/drawer_controller.dart';
import '../provider/expereince_provider.dart';
import '../provider/project_provider.dart';
import '../views/navbar.dart';
import '../views/screens/home/desktop.dart';
import '../views/screens/home/mobile.dart';
import '../widgets/social.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late PageController desktopController, mobileController;
  late MenuController menuController;

  @override
  void initState() {
    super.initState();
    Provider.of<ExperienceProvider>(context, listen: false).getExperience();
    Provider.of<ProjectProvider>(context, listen: false).getProjects();
    Provider.of<ArticleProvider>(context, listen: false).getMediumArticles();
    menuController = MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    desktopController = PageController(
        initialPage:
            Provider.of<CurrentPage>(context, listen: false).currentPage!);
    mobileController = PageController(
        initialPage:
            Provider.of<CurrentPage>(context, listen: false).currentPage!);
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
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ResponsiveLayout(
              smallScreen: MobileWidget(controller: mobileController),
              largeScreen: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Navbar(
                          controller: desktopController,
                        ),
                      ),
                      Flexible(
                          flex: 8,
                          // fit: FlexFit.tight,
                          child: DesktopWidget(controller: desktopController)),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: PageIndicator(
                                  pageController: desktopController,
                                ),
                              ),
                            ),
                            const SocialWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  blogWidget()
                ],
              ),
            ),
          ),
        ));
  }

  Widget navBarWidget() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Navbar(controller: desktopController));
  }

  Widget socialWidget() {
    return const Align(
      alignment: Alignment.bottomRight,
      child: SocialWidget(),
    );
  }

  Widget pageIndicator() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 80, right: 25),
        child: RotatedBox(
          quarterTurns: 1,
          child: PageIndicator(
            pageController: desktopController,
          ),
        ),
      ),
    );
  }

  Widget blogWidget() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: kToolbarHeight - 10,
        width: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            color: ProfileColors.cardColor),
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(10),
        child: ChangeTextOnHover(
          text: 'My Blog',
          fontSize: fontSize(context, 14),
          color: Colors.white,
          // child: const Text(

          //   style: TextStyle(color: Colors.white),
          // ),
        ),
      ),
    );
  }
}
