import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/widgets/title.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const PageTitle(title: 'MY SKILLS'),
            FractionallySizedBox(
                widthFactor: 0.5,
                alignment: Alignment.centerRight,
                child: skillWidget(context)),
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  'The main area of my expertise is Flutter App Development and Firebase (analytics and growth).\n\nI am proficient with programming languages like C/C++ and Java.\nFor web development, I work with Flutter web and also have experience with HTML, CSS, JS, jquery and Bootstrap.\n\nI work with these tools on daily basis:\nVersion Control System: Git and GitHub.\nAutomate Work Flow: GitHub Actions.\nIDE: Android Studio.\nCode Editor: VS Code.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: fontSize(context, 15), color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileColors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(child: PageTitle(title: 'Skills')),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
              child: Text(
                'The main area of my expertise is Flutter App Development and Firebase (analytics and growth).\nI am proficient with programming languages like C/C++ and Java.\nFor web development, I work with Flutter web and also have experience with HTML, CSS, JS, jquery and Bootstrap.\nI work with these tools on daily basis:\nVersion Control System: Git and GitHub.\nAutomate Work Flow: GitHub Actions.\nIDE: Android Studio.\nCode Editor: VS Code.',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: fontSize(context, 15), color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            skillWidget(context)
          ],
        ),
      );
    }
  }

  Widget skillWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              launcher.launchURL('https://wakatime.com/@HimanshuSharma');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ProfileColors.cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/wakatime_icon.png',
                  height: ResponsiveLayout.isSmallScreen(context) ? 60 : 90,
                  width: ResponsiveLayout.isSmallScreen(context) ? 60 : 90,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              launcher.launchURL('https://github.com/himanshusharma89');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: ProfileColors.cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/github_icon.png',
                  height: ResponsiveLayout.isSmallScreen(context) ? 60 : 90,
                  width: ResponsiveLayout.isSmallScreen(context) ? 60 : 90,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
