import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Article_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "ARTICLES",
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.black,
                  ),
                  width: 250.0,
                  height: 300.0,
                  child: GestureDetector(
                    onTap: () {
                      _launchURL('https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height:10.0),
                          Image.asset(
                            'assets/social/medium.png',
                            width: 150.0,
                          ),
                          SizedBox(height:30.0),
                          Text(
                            'HOW TO CREATE CARD CAROUSEL IN FLUTTER?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).showCursorOnHover.moveUpOnHover,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.black,
                  ),
                  width: 250.0,
                  height: 300.0,
                  child: GestureDetector(
                    onTap: () {
                      _launchURL('https://www.geeksforgeeks.org/blockchain-in-brief/');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height:10.0),
                          Image.asset(
                            'assets/social/gfg1.png',
                            width: 150.0,
                          ),
                          SizedBox(height:30.0),
                          Text(
                            'BLOCKCHAIN IN BRIEF?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).showCursorOnHover.moveUpOnHover,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.black,
                  ),
                  width: 250.0,
                  height: 300.0,
                  child: GestureDetector(
                    onTap: () {
                      _launchURL('https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226');
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height:10.0),
                          Image.asset(
                            'assets/social/medium.png',
                            width: 150.0,
                          ),
                          SizedBox(height:30.0),
                          Text(
                            'MY STORY OF APP DEVELOPMENT WITH FLUTTER & DART',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).showCursorOnHover.moveUpOnHover,
              ],
            ),
          ),
        ),
        SizedBox(height:80.0)
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