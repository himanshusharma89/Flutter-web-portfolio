import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:my_portfolio/helpers/translate_on_hover.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';
import 'package:my_portfolio/widgets/title.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        largeScreen: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerLeft,
              child: TranslateOnHover(
                  child: Image.network(
                'https://media-exp1.licdn.com/dms/image/C4E03AQEPWg_0mWYwaw/profile-displayphoto-shrink_400_400/0/1607276904548?e=1618444800&v=beta&t=_bm1lzC7rU7_G8_a2z5jDndXpuX-EazPDPaJakp2t28',
              )),
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Focused Computer Science major (9.89 CGPA) currently attending Chitkara University. I am a Flutter Application Developer, an Open Source contributor and a writer. I like to contribute to the community a lot. I am a writer at Flutter Community and IEEE CIET Branch. I also like to work on Alexa Skill and Google Assistant App development sometimes.\nI am a hard-working individual who is developing new applications and content for the community and trying to stay occupied all the time. Also, I am a Microsoft Learn Student Ambassador and learning new skills. I am a quick learner and frequently praised as hard-working by my peers.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: fontSize(context, 15), color: Colors.white),
                  ),
                  const SizedBox(
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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'CONTACT ME',
                            style: TextStyle(
                                color: ProfileColors.dotOutlineColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const PageTitle(title: 'ABOUT ME'),
          ],
        ),
        smallScreen: Container(
          color: ProfileColors.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const PageTitle(title: 'About Me'),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
                child: Text(
                  'Focused Computer Science major (9.89 CGPA) currently attending Chitkara University. I am a Flutter Application Developer, an Open Source contributor and a writer. I like to contribute to the community a lot. I am a writer at Flutter Community and IEEE CIET Branch. I also like to work on Alexa Skill and Google Assistant App development sometimes.\nI am a hard-working individual who is developing new applications and content for the community and trying to stay occupied all the time. Also, I am a Microsoft Learn Student Ambassador and learning new skills. I am a quick learner and frequently praised as hard-working by my peers.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize(context, 15), color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  launcher.launchURL('mailto:contact@himanshusharma.tech');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ProfileColors.dotOutlineColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'CONTACT ME',
                      style: TextStyle(color: ProfileColors.dotOutlineColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
