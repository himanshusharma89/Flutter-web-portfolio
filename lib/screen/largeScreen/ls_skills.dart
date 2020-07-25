import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Skills_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
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
  }
  Widget _skill({double percentage,String url,String imgUrl, double width}){
    return TranslateOnHover(
      child: CircularPercentIndicator(
        radius: 100.0,
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

_launchURL(String Url) async {
  var url = Url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}