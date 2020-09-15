import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/changeTextOnHover.dart';
import 'package:my_portfolio/icons/my_flutter_app_icons.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/provider/current_inex.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  final PageController controller;
  int currentIndex;
  Navbar({this.controller, this.currentIndex});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List navBarItems = [];

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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.02 + 20,
      height: height,
      // decoration: BoxDecoration(
      //   color: ProfileTheme.navBarColor,
      //   border: Border(
      //     right: BorderSide(color: Colors.grey)
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black,
      //       offset: Offset(0.0, 20.0),
      //       blurRadius: 20.0,
      //     ),
      //   ],
      // ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < navBarItems.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: navBarItem(
                    context: context,
                    index: i,
                    icon: navBarItems[i]['icon'],
                    navText: navBarItems[i]['title']),
              ),
          ],
        ),
      ),
    );
  }

  Widget navBarItem(
      {BuildContext context, int index, IconData icon, String navText}) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.1,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              Provider.of<CurrentPage>(context).setCurrentPage(index);
              widget.controller.animateToPage(index,
                  duration: Duration(milliseconds: 1000), curve: Curves.ease);
            });
          },
          child: RotatedBox(
            quarterTurns: -1,
            child: ChangeTextOnHover(
                text: navText,
                color: Provider.of<CurrentPage>(context).currentPage == index
                    ? ProfileTheme.navbarItemColor
                    : Colors.white,
                fontSize: Provider.of<CurrentPage>(context).currentPage == index ? 13 : 11),
          ),
        ),
      ),
    );
  }
}
