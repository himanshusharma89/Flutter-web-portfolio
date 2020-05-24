 import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';

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
  final hoverTransform = Matrix4.identity()..translate(0, -2, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: _hovering 
        ? Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: AutoSizeText(
              widget.text,
              style: TextStyle(
                color: ProfileTheme.subHeadingColor,
                // fontSize: 12
              ),
              maxFontSize: 12,
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