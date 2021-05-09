import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

double fontSize(BuildContext context, double size) =>
    ResponsiveLayout.isLargeScreen(context)
        ? size
        : ResponsiveLayout.isMediumScreen(context)
            ? size - 2
            : size - 3;

double navBarWidth(BuildContext context) =>
    ResponsiveLayout.isLargeScreen(context) ? 20 : 25;
