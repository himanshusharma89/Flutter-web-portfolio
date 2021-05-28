import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/change_text_on_hover.dart';
import '../helpers/colors.dart';
import '../helpers/constants.dart';
import '../helpers/functions.dart';
import '../provider/current_index.dart';

class Navbar extends StatelessWidget {
  const Navbar({required this.controller, Key? key}) : super(key: key);
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.025 + navBarWidth(context),
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: navBarItems
              .map(
                (String e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: navBarItem(
                      context: context,
                      index: navBarItems.indexOf(e),
                      navText: e),
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
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height * 0.11,
        child: GestureDetector(
          onTap: () {
            Provider.of<CurrentPage>(context, listen: false)
                .setCurrentPage(index);
            animateToPage(controller, index);
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
                  : fontSize(context, 13),
            ),
          ),
        ));
  }
}