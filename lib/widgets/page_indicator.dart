import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget pageIndicator(PageController controller, {Axis? axisDirection}) {
  return SmoothPageIndicator(
    axisDirection: axisDirection ?? Axis.horizontal,
    controller: controller,
    count: navBarItems.length,
    onDotClicked: (index) => animateToPage(controller, index),
    effect: const WormEffect(
        activeDotColor: ProfileColors.pageIndicatorColor,
        dotColor: ProfileColors.dotOutlineColor,
        dotHeight: 12,
        dotWidth: 12,
        spacing: 10,
        paintStyle: PaintingStyle.stroke,),
  );
}
