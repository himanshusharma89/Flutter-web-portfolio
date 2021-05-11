import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/colors.dart';
import '../helpers/constants.dart';
import '../helpers/functions.dart';

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
        paintStyle: PaintingStyle.stroke),
  );
}
