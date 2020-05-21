 import 'package:flutter/material.dart';

 class NavbarOnHover extends StatefulWidget {
  final Widget child;
  // You can also pass the translation in here if you want to
  NavbarOnHover({Key key, this.child}) : super(key: key);

  @override
  _NavbarOnHoverState createState() => _NavbarOnHoverState();
}

class _NavbarOnHoverState extends State<NavbarOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(10, 0, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
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