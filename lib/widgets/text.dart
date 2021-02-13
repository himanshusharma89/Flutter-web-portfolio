import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';

class MeTextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  MeTextWidget({this.text, this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: Text(
        text.toUpperCase().replaceAll(" ", "\n"),
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