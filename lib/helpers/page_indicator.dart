import 'package:flutter/material.dart';
import 'colors.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({this.pageController, Key? key}) : super(key: key);

  final PageController? pageController;

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.pageController!,
        builder: (_, __) {
          return CustomPaint(
            painter: PageIndicatorPainter(
                pageCount: 5,
                dotRadius: 7,
                dotOutlineThickness: 2,
                spacing: 15,
                scrollPosition: widget.pageController!.hasClients &&
                        widget.pageController!.page != null
                    ? widget.pageController!.page
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
    required this.pageCount,
    required this.dotRadius,
    required this.dotOutlineThickness,
    required this.spacing,
    required Color dotFillColor,
    required Color dotOutlineColor,
    required Color indicatorColor,
    this.scrollPosition = 0.0,
  })  : dotFillPaint = Paint()..color = dotFillColor,
        dotOutlinePaint = Paint()..color = dotOutlineColor,
        indicatorPaint = Paint()..color = indicatorColor;

  final int pageCount;
  final double dotRadius;
  final double dotOutlineThickness;
  final double spacing;
  final double? scrollPosition;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;
  final Paint indicatorPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final totalWidth =
        (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);
    _drawDots(canvas, center, totalWidth);
    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final pageIndexToLeft = scrollPosition!.floor();
    final leftDotX = (center.dx - (totalWidth / 2)) +
        (pageIndexToLeft * ((2 * dotRadius) + spacing));
    final transitionPercent = scrollPosition! - pageIndexToLeft;

    final laggingLeftPosition = (transitionPercent - 0.3).clamp(0.0, 1.0) / 0.7;

    final indicatorleftX =
        leftDotX + (laggingLeftPosition * ((2 * dotRadius) + spacing));

    final num acceleratedRightPositionPercent =
        (transitionPercent / 0.5).clamp(0.0, 1.0);

    final indicatorRightX = leftDotX +
        (acceleratedRightPositionPercent * ((2 * dotRadius) + spacing)) +
        (2 * dotRadius);

    canvas.drawRRect(
        RRect.fromLTRBR(indicatorleftX, -dotRadius, indicatorRightX, dotRadius,
            Radius.circular(dotRadius)),
        indicatorPaint);
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    var dotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    for (var i = 0; i < pageCount; i++) {
      _drawDot(canvas, dotCenter);
      dotCenter = dotCenter.translate((2 * dotRadius) + spacing, 0);
    }
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadius - dotOutlineThickness, dotFillPaint);

    final outlinePath = Path()
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
