import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../helpers/colors.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton(
      {required this.text,
      required this.onTap,
      this.height,
      this.width,
      Key? key})
      : super(key: key);

  final String text;
  final double? height, width;
  final Function() onTap;

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              border: Border.all(color: ProfileColors.dotOutlineColor),
              borderRadius: BorderRadius.circular(22),
              color: _hovering
                  ? ProfileColors.dotOutlineColor
                  : Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Text(
              widget.text,
              style: TextStyle(
                  color:
                      _hovering ? Colors.white : ProfileColors.dotOutlineColor),
            ),
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
