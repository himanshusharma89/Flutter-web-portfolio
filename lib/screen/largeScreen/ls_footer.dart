import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/dashedLine.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Footer_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height:height*0.05),
        MySeparator(color: Colors.white,),
        SizedBox(height:height*0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(42, 46, 53, 1),
              onPressed: () {
                _launchURL("https://github.com/himanshusharma89");
              },
              child: Image.asset('assets/social/github.png',
                width: 45.0,
                height: 45.0,),
            ).showCursorOnHover.moveUpOnHover,
            SizedBox(width: width*0.01,),
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(42, 46, 53, 1),
              onPressed: () {
                _launchURL("https://twitter.com/_SharmaHimanshu");
              },
              child: Image.asset('assets/social/twitter.png',
              width: 45.0,
                height: 45.0,),
            ).showCursorOnHover.moveUpOnHover,
            SizedBox(width: width*0.01,),
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(42, 46, 53, 1),
              onPressed: () {
                _launchURL("https://www.linkedin.com/in/himanshusharma89/");
              },
              child: Image.asset('assets/social/linkedIn.png',
              width: 45.0,
                height: 45.0,),
            ).showCursorOnHover.moveUpOnHover,
            SizedBox(width: width*0.01,),
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(42, 46, 53, 1),
              onPressed: () {
                _launchURL("https://stackoverflow.com/users/11545939/himanshu-sharma");
              },
              child: Image.asset('assets/social/stack-overflow.png',
              width: 45.0,
                height: 45.0,),
            ).showCursorOnHover.moveUpOnHover,
          ],
        ),
        SizedBox(height:height*0.05),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.code,
                color: Colors.white,
                size: 30,
              ),
              Text(
                " WITH ",
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 15.0,
                  fontFamily: "Poppins"
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.asset('assets/flutter.png',
                  width: 40.0,
                )
              ),
              Text(
                " WEB",
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: "Poppins"
                ),
              ),
              Text(
                " AND ",
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 15.0,
                  fontFamily: "Poppins"
                ),
              ),
              Image.asset(
                'heart.png',
                width: 25,height: 25,
              ),
            ],
          ),
        ),
        SizedBox(height:height*0.06),
      ],
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