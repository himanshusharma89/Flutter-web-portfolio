import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/profile_theme.dart';

 class ChangeTextOnHover extends StatefulWidget {
  final Widget child;
  final String text;
  // You can also pass the translation in here if you want to
  ChangeTextOnHover({Key key, this.child, this.text}) : super(key: key);

  @override
  _ChangeTextOnHoverState createState() => _ChangeTextOnHoverState();
}

class _ChangeTextOnHoverState extends State<ChangeTextOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -1.5, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        _mouseEnter(true);
      },
      onExit: (e) {
        _mouseEnter(false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: _hovering 
        ? Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: AutoSizeText(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ProfileTheme.subHeadingColor,
                fontWeight: FontWeight.w700
              ),
              minFontSize: 11,
              maxFontSize: 11,
              maxLines: 1,
            ),
          ),
        ) 
        : widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}