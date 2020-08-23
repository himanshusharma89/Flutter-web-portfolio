import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/changeTextOnHover.dart';
import 'package:my_portfolio/icons/my_flutter_app_icons.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Navbar extends StatefulWidget {
  final PageController controller;
  int currentIndex;
  Navbar({this.controller,this.currentIndex});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  List navBarItems=[];

  @override
  void initState() {
    super.initState();
    navBarItems = [
      {
        'icon': MyFlutterApp.home,
        'title': 'HOME',
      },
      {
        'icon': MyFlutterApp.me,
        'title': 'ABOUT',
      },
      {
        'icon': MyFlutterApp.skill,
        'title': 'SKILLS',
      },
      {
        'icon': MyFlutterApp.code,
        'title': 'WORK',
      },
      {
        'icon': MyFlutterApp.laptop,
        'title': 'PROJECTS',
      },
      {
        'icon': MyFlutterApp.article,
        'title': 'ARTICLES',
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
      return  Container(
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
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
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
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for(int i=0;i<navBarItems.length;i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: navBarItem(
                          context: context,
                          index:i,
                          icon:navBarItems[i]['icon'],
                          navText:navBarItems[i]['title']
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget navBarItem({
    BuildContext context,
    int index,
    IconData icon, 
    String navText
    }){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      height: height*0.05,
      width: width,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.currentIndex=index;
            widget.controller.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.ease);
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