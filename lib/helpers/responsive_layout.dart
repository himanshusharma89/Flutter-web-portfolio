import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.largeScreen,
    required this.smallScreen,
    super.key,
    this.mediumScreen,
  });

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget smallScreen;

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 780;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 780 &&
        MediaQuery.of(context).size.width <= 960;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 960;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        if (constraints.maxWidth > 780) {
          return largeScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
