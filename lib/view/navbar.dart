import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/changeTextOnHover.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  final PageController controller;
  Navbar({this.controller});

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
        'title': 'HOME',
      },
      {
        'title': 'ABOUT',
      },
      {
        'title': 'SKILLS',
      },
      {
        'title': 'WORK',
      },
      {
        'title': 'PROJECTS',
      },
      {
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
                    navText: navBarItems[i]['title']),
              ),
          ],
        ),
      ),
    );
  }

  Widget navBarItem({BuildContext context, int index, String navText}) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.1,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Provider.of<CurrentPage>(context, listen: false)
                .setCurrentPage(index);
            widget.controller.animateToPage(index,
                duration: Duration(milliseconds: 1000), curve: Curves.ease);
          },
          child: RotatedBox(
            quarterTurns: -1,
            child: ChangeTextOnHover(
                text: navText,
                color: Provider.of<CurrentPage>(context).currentPage == index
                    ? ProfileColors.navbarItemColor
                    : Colors.white,
                fontSize: Provider.of<CurrentPage>(context).currentPage == index
                    ? 13
                    : 11),
          ),
        ),
      ),
    );
  }
}
