import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

class ChangeTextOnHover extends StatefulWidget {
  // You can also pass the translation in here if you want to
  const ChangeTextOnHover({Key key, this.text, this.color, this.fontSize})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;

  @override
  _ChangeTextOnHoverState createState() => _ChangeTextOnHoverState();
}

class _ChangeTextOnHoverState extends State<ChangeTextOnHover> {
  final Matrix4 nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final Matrix4 hoverTransform = Matrix4.identity()..translate(0, -1.5, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (PointerHoverEvent e) {
        _mouseEnter(true);
      },
      onExit: (PointerExitEvent e) {
        _mouseEnter(false);
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        style: TextStyle(
            color: _hovering ? ProfileColors.navbarItemColor : widget.color,
            fontWeight: FontWeight.normal,
            fontSize: _hovering
                ? ResponsiveLayout.isMediumScreen(context)
                    ? 11
                    : 13
                : ResponsiveLayout.isMediumScreen(context)
                    ? widget.fontSize - 2
                    : widget.fontSize),
        child: Center(
          child: Text(
            widget.text,
            maxLines: 1,
          ),
        ),
        // transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
