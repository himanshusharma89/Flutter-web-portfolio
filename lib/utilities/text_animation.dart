import 'package:flutter/material.dart';

class TypingTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  TypingTextAnimation({this.text,this.textStyle});
  @override
  State createState() => new TypingTextAnimationState();
}

class TypingTextAnimationState extends State<TypingTextAnimation> with TickerProviderStateMixin {
  Animation<int> _characterCount;
  String get _text => widget.text;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    setState(() {
      _characterCount = StepTween(begin: 0, end: _text.length).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = widget.textStyle;
    var animatedTxt = Container(
      child: _characterCount == null
      ? null
      : AnimatedBuilder(
          animation: _characterCount,
          builder: (BuildContext context, Widget child) {
            String text = _text.substring(0, _characterCount.value);
            return Text(text, style: textStyle);
          },
        ),
    );
    return animatedTxt;
  }
}