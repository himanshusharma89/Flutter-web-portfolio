import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/change_text_on_hover.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:provider/provider.dart';

import '../helpers/responsive_layout.dart';

class Navbar extends StatelessWidget {
  const Navbar({this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.022 + navBarWidth(context),
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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (int i = 0; i < navBarItems.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: navBarItem(
                    context: context,
                    index: i,
                    navText: navBarItems[i]['title'].toString()),
              ),
          ],
        ),
      ),
    );
  }

  Widget navBarItem({BuildContext context, int index, String navText}) {
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.11,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Provider.of<CurrentPage>(context, listen: false)
                .setCurrentPage(index);
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.ease);
          },
          child: RotatedBox(
            quarterTurns: -1,
            child: ChangeTextOnHover(
                text: navText,
                color: Provider.of<CurrentPage>(context).currentPage == index
                    ? ProfileColors.navbarItemColor
                    : Colors.white,
                fontSize: Provider.of<CurrentPage>(context).currentPage == index
                    ? fontSize(context, 15)
                    : ResponsiveLayout.isMediumScreen(context)
                        ? fontSize(context, 15) - 2
                        : fontSize(context, 15) - 4),
          ),
        ),
      ),
    );
  }
}
