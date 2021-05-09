import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/change_text_on_hover.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.025 + navBarWidth(context),
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: navBarItems
              .map(
                (Map<String, String> e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: navBarItem(
                      context: context,
                      index: navBarItems.indexOf(e),
                      navText: e['title'].toString()),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget navBarItem({
    required BuildContext context,
    required String navText,
    required int index,
  }) {
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
                    ? fontSize(context, 16)
                    : fontSize(context, 13),
              ),
            ),
          ),
        ));
  }
}
