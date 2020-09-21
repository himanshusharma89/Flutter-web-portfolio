import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';

import '../profile_theme.dart';

class PageTitle extends StatefulWidget {
  final String title;
  PageTitle({@required this.title});
  @override
  _PageTitleState createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ProfileTheme.cardHeadingColor,
            fontSize: ResponsiveLayout.isSmallScreen(context) ? 20 : 25.0,
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.0625,
            child: Divider(
              color: Colors.white,
              thickness: 1.0,
            )),
      ],
    );
  }
}
