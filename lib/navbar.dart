import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/changeTextOnHover.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatefulWidget {
  final PageController controller;
  int currentIndex;
  bool darkmode;
  Navbar({this.controller,this.darkmode,this.currentIndex});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  PageController controller;

  @override
  void initState() {
    controller=widget.controller;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      color: ProfileTheme.navBarColor,
      child: Column(
        children: <Widget>[
          if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
            Container(
              width: width*0.05,
              height: height,
              decoration: BoxDecoration(
                color: ProfileTheme.navBarColor,
                border: Border(
                  right: BorderSide(color: Colors.grey)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 20.0),
                    blurRadius: 20.0,
                  ),
                ], 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  navBarItem(0,'home.png','HOME',60,60).showCursorOnHover,
                  navBarItem(1,'me.png','ABOUT',60,60).showCursorOnHover,
                  navBarItem(2,'skill.png','SKILLS',60,60).showCursorOnHover,
                  navBarItem(3,'Experience.png','EXPERIENCE',50,50).showCursorOnHover,
                  navBarItem(4,'project.png','PROJECTS',50,50).showCursorOnHover,
                  // navBarItem(0,'achievements.png','ACHIEVEMENTS',55,55).showCursorOnHover,
                  navBarItem(5,'article.png','ARTICLES',55,55).showCursorOnHover,
                ],
              ),
            )
          else if(ResponsiveLayout.isSmallScreen(context))
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 55.0,
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
                SizedBox(height:20.0),
                Column(
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
          ),
        ],
      ),
    );
  }

  Widget navBarItem(int index,String imgUrl, String navText, double w, double h){
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.currentIndex=index;
          controller.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.ease);
        });
      },
      child: Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
          child: ChangeTextOnHover(
            child: Image.asset(
              imgUrl,
              width: w,height: h,
              color: (widget.currentIndex==index) ? ProfileTheme.subHeadingColor : null,
            ),
            text: navText,
          ),
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