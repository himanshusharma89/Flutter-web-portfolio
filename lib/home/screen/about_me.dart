import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/launcher.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/title.dart';

final Launcher launcher = Launcher();

class AboutMe extends StatelessWidget {
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
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 150, horizontal: 150),
                child: TranslateOnHover(
                    child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: FadeInImage(
                      placeholder: AssetImage('assets/placeholder.gif'),
                      image: AssetImage('self.jpg')),
                )),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        launcher
                            .launchURL('mailto:contact@himanshusharma.tech');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ProfileTheme.dotOutlineColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'CONTACT ME',
                            style:
                                TextStyle(color: ProfileTheme.dotOutlineColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: PageTitle(title: "ABOUT ME")),
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileTheme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageTitle(title: 'About Me'),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
              child: Text(
                "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                launcher.launchURL('mailto:contact@himanshusharma.tech');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ProfileTheme.dotOutlineColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CONTACT ME',
                    style: TextStyle(color: ProfileTheme.dotOutlineColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
