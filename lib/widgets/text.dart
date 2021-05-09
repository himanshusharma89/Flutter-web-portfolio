import 'package:flutter/material.dart';
import '../helpers/responsive_layout.dart';

class MeTextWidget extends StatelessWidget {
  const MeTextWidget({required this.text, this.textAlign, Key? key})
      : super(key: key);

  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      // fit: FlexFit.tight,
      child: Text(
        text.replaceAll(' ', '\n'),
        textAlign: textAlign,
        maxLines: 2,
        style: TextStyle(
          letterSpacing: 2.2,
          fontSize: ResponsiveLayout.isMediumScreen(context) ? 25 : 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
