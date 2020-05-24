import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveLayout(
      {Key key,
      @required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 780;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 780 &&
        MediaQuery.of(context).size.width < 960;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 960;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 960) {
          return largeScreen;
        } else if (constraints.maxWidth < 960 && constraints.maxWidth > 780) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
