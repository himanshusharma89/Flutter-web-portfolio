import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({this.pageController});

  final PageController pageController;

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.pageController,
        builder: (_, __) {
          return CustomPaint(
            painter: PageIndicatorPainter(
                pageCount: 6,
                dotRadius: ResponsiveLayout.isMediumScreen(context) ? 5 : 7,
                dotOutlineThickness:
                    ResponsiveLayout.isMediumScreen(context) ? 1 : 2,
                spacing: 15,
                scrollPosition: widget.pageController.hasClients &&
                        widget.pageController.page != null
                    ? widget.pageController.page
                    : 0.0,
                dotFillColor: Colors.transparent,
                dotOutlineColor: ProfileColors.dotOutlineColor,
                indicatorColor: ProfileColors.pageIndicatorColor),
          );
        });
  }
}

class PageIndicatorPainter extends CustomPainter {
  PageIndicatorPainter({
    @required this.pageCount,
    @required this.dotRadius,
    @required this.dotOutlineThickness,
    @required this.spacing,
    @required Color dotFillColor,
    @required Color dotOutlineColor,
    @required Color indicatorColor,
    this.scrollPosition = 0.0,
  })  : dotFillPaint = Paint()..color = dotFillColor,
        dotOutlinePaint = Paint()..color = dotOutlineColor,
        indicatorPaint = Paint()..color = indicatorColor;

  final int pageCount;
  final double dotRadius;
  final double dotOutlineThickness;
  final double spacing;
  final double scrollPosition;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;
  final Paint indicatorPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth =
        (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);
    _drawDots(canvas, center, totalWidth);
    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final int pageIndexToLeft = scrollPosition.floor();
    final double leftDotX = (center.dx - (totalWidth / 2)) +
        (pageIndexToLeft * ((2 * dotRadius) + spacing));
    final double transitionPercent = scrollPosition - pageIndexToLeft;

    final double laggingLeftPosition =
        (transitionPercent - 0.3).clamp(0.0, 1.0) / 0.7;

    final double indicatorleftX =
        leftDotX + (laggingLeftPosition * ((2 * dotRadius) + spacing));

    final num acceleratedRightPositionPercent =
        (transitionPercent / 0.5).clamp(0.0, 1.0);

    final double indicatorRightX = leftDotX +
        (acceleratedRightPositionPercent * ((2 * dotRadius) + spacing)) +
        (2 * dotRadius);

    canvas.drawRRect(
        RRect.fromLTRBR(indicatorleftX, -dotRadius, indicatorRightX, dotRadius,
            Radius.circular(dotRadius)),
        indicatorPaint);
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    Offset dotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    for (int i = 0; i < pageCount; i++) {
      _drawDot(canvas, dotCenter);
      dotCenter = dotCenter.translate((2 * dotRadius) + spacing, 0);
    }
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadius - dotOutlineThickness, dotFillPaint);

    final Path outlinePath = Path()
      ..addOval(Rect.fromCircle(radius: dotRadius, center: dotCenter))
      ..addOval(Rect.fromCircle(
          radius: dotRadius - dotOutlineThickness, center: dotCenter))
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(outlinePath, dotOutlinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
