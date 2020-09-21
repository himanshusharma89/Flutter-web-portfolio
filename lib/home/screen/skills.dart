import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/home/screen/about_me.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/title.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
                widthFactor: 0.5,
                alignment: Alignment.centerRight,
                child: skillWidget()),
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    "MY SKILLS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ProfileTheme.cardHeadingColor,
                      fontSize: 25.0,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.0625,
                      child: Divider(
                        color: Colors.white,
                        thickness: 2.0,
                      )),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileTheme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: PageTitle(title: 'Skills')),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
              child: Text(
                "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            skillWidget()
          ],
        ),
      );
    }
  }

  Widget skillWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            launcher.launchURL('https://wakatime.com/@HimanshuSharma');
          },
          child: Container(
            decoration: BoxDecoration(
                color: ProfileTheme.cardColor,
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
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () {
            launcher.launchURL('https://github.com/himanshusharma89');
          },
          child: Container(
            decoration: BoxDecoration(
                color: ProfileTheme.cardColor,
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
        )
      ],
    );
  }
}
