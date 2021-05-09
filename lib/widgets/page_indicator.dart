import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/animate_to_page.dart';
import '../helpers/colors.dart';

Widget pageIndicator(PageController controller) {
  return Center(
    child: SmoothPageIndicator(
      axisDirection: Axis.vertical,
      controller: controller,
      count: 5,
      onDotClicked: (index) => animateToPage(controller, index),
      effect: const WormEffect(
          activeDotColor: ProfileColors.pageIndicatorColor,
          dotColor: ProfileColors.dotOutlineColor,
          dotHeight: 12,
          dotWidth: 12,
          spacing: 10,
          paintStyle: PaintingStyle.stroke),
    ),
  );
}
