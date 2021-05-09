import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/functions.dart';
import '../helpers/responsive_layout.dart';
import '../provider/article_provider.dart';
import '../provider/current_index.dart';
import '../provider/drawer_controller.dart';
import '../provider/expereince_provider.dart';
import '../provider/project_provider.dart';
import '../views/navbar.dart';
import '../views/screens/home/desktop.dart';
import '../views/screens/home/mobile.dart';
import '../widgets/button.dart';
import '../widgets/page_indicator.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<MenuController>.value(
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
                    flex: 8,
                    fit: FlexFit.tight,
                    child: DesktopWidget(controller: desktopController)),
                Flexible(
                  child: SizedBox(
                    width: width * 0.025 + navBarWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 7),
                            //   child: ProfileButton(
                            //       height: height * 0.05,
                            //       text: 'Blog',
                            //       link: 'https://blog.himanshusharma.tech/'),
                            // ),
                            // const Spacer()
                          ],
                        )),
                        Expanded(child: pageIndicator(desktopController)),
                        const Expanded(child: SocialWidget()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
