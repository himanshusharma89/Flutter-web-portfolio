import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
      child: Container(
        child: Column(
          children: <Widget>[
            if(!ResponsiveLayout.isSmallScreen(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        gradient: LinearGradient(
                          colors: [Color(0xff363795),Colors.blueAccent, ]
                        )
                      ),
                      child: Center(
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left:6.0,right: 6.0,top: 3.0,bottom: 3.0),
                            child: Text(
                              "HS",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 30.0,
                                color: Colors.blueAccent,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).moveUpOnHover,
                  ],
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        _launchURL("https://github.com/himanshusharma89");
                      },
                      child: Image.asset(
                        'assets/social/github.png',
                        width: 54.0,
                        height: 54.0,
                      ),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://twitter.com/_SharmaHimanshu");
                      },
                      child: Image.asset('assets/social/twitter.png',
                        width: 54.0,
                        height: 54.0,
                      ),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        _launchURL("https://www.linkedin.com/in/himanshusharma89/");
                      },
                      child: Image.asset('assets/social/linkedIn.png',
                        width: 54.0,
                        height: 54.0,
                      ),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://stackoverflow.com/users/11545939/himanshu-sharma");
                      },
                      child: Image.asset('assets/social/stack-overflow.png',
                        width: 54.0,
                        height: 54.0,
                      ),
                    ).showCursorOnHover.moveUpOnHover,
                  ],
                )
              ],
            )
          else
            Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        gradient: LinearGradient(
                          colors: [Color(0xff363795),Colors.blueAccent, ]
                        )
                      ),
                      child: Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 9.0,bottom: 9.0),
                            child: Text(
                              "HS",
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 24.0,
                                color: Colors.blueAccent
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).moveUpOnHover,
                    // SizedBox(height: 16.0,),
                    // Text(
                    //   "Himanshu Sharma",
                    //   style: TextStyle(
                    //     letterSpacing: 0.2,
                    //     fontSize: 30.0,
                    //     color: Colors.white,
                    //     fontFamily: "Poppins"
                    //   ),
                    // )
                  ],
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://github.com/himanshusharma89");
                      },
                      child: Image.asset('assets/social/github.png',
                       width: 50.0,
                       height: 50.0,),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://twitter.com/_SharmaHimanshu");
                      },
                      child: Image.asset('assets/social/twitter.png',
                      width: 50.0,
                       height: 50.0,),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://www.linkedin.com/in/himanshusharma89/");
                      },
                      child: Image.asset('assets/social/linkedIn.png',
                      width: 50.0,
                       height: 50.0,),
                    ).showCursorOnHover.moveUpOnHover,
                     SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://stackoverflow.com/users/11545939/himanshu-sharma");
                      },
                      child: Image.asset('assets/social/stack-overflow.png',
                      width: 50.0,
                       height: 50.0,),
                    ).showCursorOnHover.moveUpOnHover,
                  ],
                ),
              ],
            ),
          ],
        ),
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