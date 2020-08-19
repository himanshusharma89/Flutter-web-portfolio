import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context)) {
      return Column(
        children: <Widget>[
          SizedBox(height:height*0.05),
          Text(
            "ARTICLES",
            style: TextStyle(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _article(
                      context: context,
                      url: 'https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19',
                      imgUrl: 'assets/social/medium.png',
                      title: 'HOW TO CREATE CARD CAROUSEL IN FLUTTER?'
                    ),
                    _article(
                      context: context,
                      url: 'https://www.geeksforgeeks.org/blockchain-in-brief/',
                      imgUrl: 'assets/social/gfg1.png',
                      title: 'BLOCKCHAIN IN BRIEF?'
                    ),
                    _article(
                      context: context,
                      url: 'https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226',
                      imgUrl: 'assets/social/medium.png',
                      title: 'MY STORY OF APP DEVELOPMENT WITH FLUTTER & DART'
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height:height*0.12),
        ],
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Text(
              "ARTICLES",
              style: TextStyle(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.black,
                      ),
                      width: MediaQuery.of(context).size.width*0.56,
                      child: GestureDetector(
                        onTap: () {
                          _launchURL('https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19');
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:40.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.black,
                      ),
                      width: MediaQuery.of(context).size.width*0.56,
                      child: GestureDetector(
                        onTap: () {
                          _launchURL('https://www.geeksforgeeks.org/blockchain-in-brief/');
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:40.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.black,
                      ),
                      width: MediaQuery.of(context).size.width*0.56,
                      child: GestureDetector(
                        onTap: () {
                          _launchURL('https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226');
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:80.0)
          ],
        ),
      );
    }
  }
  Widget _article({BuildContext context,String url,String imgUrl,String title}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return TranslateOnHover(
      child: HandCursor(
        child: Container(
          width: width*0.2,
          child: GestureDetector(
            onTap: () {
              _launchURL(url);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color(0xff2a2e35),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height:10.0),
                    Image.asset(
                      imgUrl,
                      height: height*0.15,
                    ),
                    SizedBox(height:30.0),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(178, 190, 205,1),
                        fontSize: 17.0,
                                fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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