 import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';

 class TranslateOnHover extends StatefulWidget {
  const TranslateOnHover({Key? key, this.child}) : super(key: key);

  final Widget? child;
  // You can also pass the translation in here if you want to

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final Matrix4 nonHoverTransform = Matrix4.identity()..translate(0);
  final Matrix4 hoverTransform = Matrix4.identity()..translate(0, -5);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent e) => _mouseEnter(true),
      onExit: (PointerExitEvent e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}