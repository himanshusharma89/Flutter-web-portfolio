import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Skills_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(height:height*0.05),
        Text(
          "SKILLS",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.0625,
          child: Divider(
            color: Colors.white,
            thickness: 3.0,
          )
        ),
        SizedBox(height:30.0),
        Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _skill(percentage: 0.9,url: 'https://sourcerer.io/himanshusharma89',imgUrl: 'assets/tech/c.png',width:55),
                _skill(percentage: 0.6,url: 'https://sourcerer.io/himanshusharma89',imgUrl: 'assets/tech/c++.png',width:55),
                _skill(percentage: 0.7,url: 'https://sourcerer.io/himanshusharma89',imgUrl: 'assets/tech/java.png',width:55),
                _skill(percentage: 0.9,url: 'https://sourcerer.io/himanshusharma89',imgUrl: 'assets/tech/html.png',width:40),
                _skill(percentage: 0.8,url: 'https://sourcerer.io/himanshusharma89',imgUrl: 'assets/tech/css.png',width:40),
                _skill(percentage: 0.8,url: 'https://sourcerer.io/himanshusharma89',imgUrl: 'assets/tech/dart.png',width:45),
              ],
            ),
          ),
        ),
        SizedBox(height:height*0.12),
      ],
    );
  }
  Widget _skill({double percentage,String url,String imgUrl, double width}){
    return CircularPercentIndicator(
      radius: 100.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 15.0,
      percent: percentage,
      center: GestureDetector(
        onTap: () {
          _launchURL(url);
        },
        child: Image.asset(
          imgUrl,
          width: width,
        ).showCursorOnHover,
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.white24,
      progressColor: Colors.white,
    ).moveUpOnHover;
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