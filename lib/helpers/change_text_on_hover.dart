import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/functions.dart';

class ChangeTextOnHover extends StatefulWidget {
  // You can also pass the translation in here if you want to
  const ChangeTextOnHover({
    required this.text,
    required this.fontSize,
    super.key,
    this.color,
  });

  final String text;
  final Color? color;
  final double fontSize;

  @override
  _ChangeTextOnHoverState createState() => _ChangeTextOnHoverState();
}

class _ChangeTextOnHoverState extends State<ChangeTextOnHover> {
  final Matrix4 nonHoverTransform = Matrix4.identity()..translate(0);
  final Matrix4 hoverTransform = Matrix4.identity()..translate(0, -1.5);

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
            fontSize: _hovering ? fontSize(context, 15) : widget.fontSize,),
        child: Center(
          child: Text(
            widget.text,
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
