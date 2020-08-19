import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Skills extends StatefulWidget {

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List skill=[
    {
      'percentage': 0.9,
      'imgUrl': 'assets/tech/c.png',
      'width': 55.0,
    },
    {
      'percentage': 0.6,
      'imgUrl': 'assets/tech/c++.png',
      'width': 55.0,
    },
    {
      'percentage': 0.7,
      'imgUrl': 'assets/tech/java.png',
      'width': 55.0,
    },
    {
      'percentage': 0.9,
      'imgUrl': 'assets/tech/html.png',
      'width': 55.0,
    },
    {
      'percentage': 0.8,
      'imgUrl': 'assets/tech/css.png',
      'width': 50.0,
    },
    {
      'percentage': 0.8,
      'imgUrl': 'assets/tech/dart.png',
      'width': 50.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "MY SKILLS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ProfileTheme.cardHeadingColor,
                fontSize: 35.0,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.0625,
              child: Divider(
                color: Colors.white,
                thickness: 3.0,
              )
            ),
            Container(
              width: width*0.5,
              padding: const EdgeInsets.only(top:5),
              child: Text(
                "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Text(
              "SKILLS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.125,
              child: Divider(
                color: Colors.white,
                thickness: 3.0,
              )
            ),
            Container(
              height: height*0.8,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5/0.3
                  ), 
                  itemCount: skill.length,
                  itemBuilder: (_, index){
                    return _skill(
                      percentage: skill[index]['percentage'],
                      url: 'https://sourcerer.io/himanshusharma89',
                      imgUrl: skill[index]['imgUrl'],
                      width: skill[index]['width'],
                    );
                  }
                )
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _skill({double percentage,String url,String imgUrl, double width}){
    return TranslateOnHover(
      child: CircularPercentIndicator(
        radius: 130.0,
        animation: true,
        animationDuration: 1200,
        lineWidth: 15.0,
        percent: percentage,
        center: GestureDetector(
          onTap: () {
            _launchURL(url);
          },
          child: HandCursor(
            child: Image.asset(
              imgUrl,
              width: width,
            ),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.white24,
        progressColor: Colors.white,
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}