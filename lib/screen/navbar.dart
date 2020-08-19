import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/changeTextOnHover.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/icons/my_flutter_app_icons.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatefulWidget {
  final PageController controller;
  int currentIndex;
  Navbar({this.controller,this.currentIndex});

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
      color: ProfileTheme.color2,
      child: Column(
        children: <Widget>[
          if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context))
            Container(
              width: width*0.04,
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
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        controller.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
                      });
                    },
                    child: HandCursor(
                      child: Container(
                        height: height*0.08,
                        width: width,
                        color: Colors.black,
                        child: Image.asset('heart_blue.png'),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          navBarItem(context,0,MyFlutterApp.home,'HOME'),
                          SizedBox(height: height*0.02,),
                          navBarItem(context,1,MyFlutterApp.me,'ABOUT'),
                          SizedBox(height: height*0.02,),
                          navBarItem(context,2,MyFlutterApp.skill,'SKILLS'),
                          SizedBox(height: height*0.02,),
                          navBarItem(context,3,MyFlutterApp.code,'WORK'),
                          SizedBox(height: height*0.02,),
                          navBarItem(context,4,MyFlutterApp.laptop,'PROJECTS'),
                          SizedBox(height: height*0.02,),
                          // navBarItem(context,0,'achievements.png','ACHIEVEMENTS',55,55),
                          navBarItem(context,5,MyFlutterApp.article,'ARTICLES'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          else if(ResponsiveLayout.isSmallScreen(context))
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TranslateOnHover(
                    child: Container(
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
                    ),
                  ),
                  SizedBox(height:20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TranslateOnHover(
                        child: HandCursor(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL("https://github.com/himanshusharma89");
                            },
                            child: Image.asset('assets/social/github.png',
                            width: 50.0,
                            height: 50.0,),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TranslateOnHover(
                        child: HandCursor(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL("https://twitter.com/_SharmaHimanshu");
                            },
                            child: Image.asset('assets/social/twitter.png',
                            width: 50.0,
                            height: 50.0,),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TranslateOnHover(
                        child: HandCursor(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL("https://www.linkedin.com/in/himanshusharma89/");
                            },
                            child: Image.asset('assets/social/linkedIn.png',
                            width: 50.0,
                            height: 50.0,),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TranslateOnHover(
                        child: HandCursor(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL("https://stackoverflow.com/users/11545939/himanshu-sharma");
                            },
                            child: Image.asset('assets/social/stack-overflow.png',
                            width: 50.0,
                            height: 50.0,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget navBarItem(BuildContext context,int index,IconData icon, String navText){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      height: height*0.05,
      width: width,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.currentIndex=index;
            controller.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.ease);
          });
        },
        child: HandCursor(
          child: ResponsiveLayout.isMediumScreen(context)
          ? Icon(
              icon,
              size: 28,
              color: (widget.currentIndex==index) ? ProfileTheme.subHeadingColor : Colors.grey,
            )
          : ChangeTextOnHover(
            child: Icon(
              icon,
              size: 28,
              color: (widget.currentIndex==index) ? ProfileTheme.subHeadingColor : Colors.grey,
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