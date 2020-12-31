import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/translateOnHover.dart';
import 'package:my_portfolio/profile_colors.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';
import 'package:my_portfolio/helpers/title.dart';

import '../main.dart';

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
                    image: NetworkImage(
                      'https://avatars0.githubusercontent.com/u/44980497?v=4',
                    ),
                  ),
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
                    "Focused Computer Science major (9.89 CGPA) currently attending Chitkara University. I am a Flutter Application Developer, an Open Source contributor and a writer. I like to contribute to the community a lot. I am a writer at Flutter Community and IEEE CIET Branch. I also like to work on Alexa Skill and Google Assistant App development sometimes.\nI am a hard-working individual who is developing new applications and content for the community and trying to stay occupied all the time. Also, I am a Microsoft Learn Student Ambassador and learning new skills. I am a quick learner and frequently praised as hard-working by my peers.",
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
                                color: ProfileColors.dotOutlineColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'CONTACT ME',
                            style:
                                TextStyle(color: ProfileColors.dotOutlineColor),
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
        color: ProfileColors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PageTitle(title: 'About Me'),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
              child: Text(
                "Focused Computer Science major (9.89 CGPA) currently attending Chitkara University. I am a Flutter Application Developer, an Open Source contributor and a writer. I like to contribute to the community a lot. I am a writer at Flutter Community and IEEE CIET Branch. I also like to work on Alexa Skill and Google Assistant App development sometimes.\nI am a hard-working individual who is developing new applications and content for the community and trying to stay occupied all the time. Also, I am a Microsoft Learn Student Ambassador and learning new skills. I am a quick learner and frequently praised as hard-working by my peers.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                launcher.launchURL('mailto:contact@himanshusharma.tech');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ProfileColors.dotOutlineColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CONTACT ME',
                    style: TextStyle(color: ProfileColors.dotOutlineColor),
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
