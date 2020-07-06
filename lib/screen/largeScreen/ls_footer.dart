import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/dashedLine.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
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
        ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            height: height * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: ProfileTheme.backgroundColor),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ProfileTheme.navBarColor,
                  ProfileTheme.backgroundColor,
                  ProfileTheme.navBarColor,
                ],
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 3.0),
                    color: Color(0xFF3383CD),
                    blurRadius: 6.0)
              ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TranslateOnHover(
                      child: HandCursor(
                        child: FloatingActionButton(
                          backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                          onPressed: () {
                            _launchURL("https://github.com/himanshusharma89");
                          },
                          child: Image.asset('assets/social/github.png',
                            width: 45.0,
                            height: 45.0,),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.01,),
                    TranslateOnHover(
                      child: HandCursor(
                        child: FloatingActionButton(
                          backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                          onPressed: () {
                            _launchURL("https://twitter.com/_SharmaHimanshu");
                          },
                          child: Image.asset('assets/social/twitter.png',
                          width: 45.0,
                            height: 45.0,),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.01,),
                    TranslateOnHover(
                      child: HandCursor(
                        child: FloatingActionButton(
                          backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                          onPressed: () {
                            _launchURL("https://www.linkedin.com/in/himanshusharma89/");
                          },
                          child: Image.asset('assets/social/linkedIn.png',
                          width: 45.0,
                            height: 45.0,),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.01,),
                    TranslateOnHover(
                      child: HandCursor(
                        child: FloatingActionButton(
                          backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                          onPressed: () {
                            _launchURL("https://stackoverflow.com/users/11545939/himanshu-sharma");
                          },
                          child: Image.asset('assets/social/stack-overflow.png',
                          width: 45.0,
                            height: 45.0,),
                        ),
                      ),
                    ),
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
                          color: ProfileTheme.subHeadingColor,
                          fontSize: 15.0,
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
                        ),
                      ),
                      Text(
                        " AND ",
                        style: TextStyle(
                          letterSpacing: 1,
                          color: ProfileTheme.subHeadingColor,
                          fontSize: 15.0,
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
            )
          ),
        ),
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

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 263);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 263);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}