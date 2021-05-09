import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/widgets/title.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        largeScreen: Stack(
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
              child: Center(child: text(context)),
            ),
          ],
        ),
        smallScreen: Container(
          color: ProfileColors.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(child: PageTitle(title: 'Skills')),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
                child: text(context),
              ),
              const SizedBox(
                height: 20,
              ),
              skillWidget(context)
            ],
          ),
        ));
  }

  Widget text(BuildContext context) {
    return Text(
      'The main area of my expertise is Flutter App Development and Firebase (analytics and growth).\nI am proficient with programming languages like C/C++ and Java.\nFor web development, I work with Flutter web and also have experience with HTML, CSS, JS, jquery and Bootstrap.\nI work with these tools on daily basis:\nVersion Control System: Git and GitHub.\nAutomate Work Flow: GitHub Actions.\nIDE: Android Studio.\nCode Editor: VS Code.',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize(context, 16),
          color: Colors.white,
          height: 1.2,
          letterSpacing: 0.2),
    );
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
