import 'package:flutter/material.dart';

import 'package:my_portfolio/helpers/colors.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

class PageTitle extends StatefulWidget {
  const PageTitle({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _PageTitleState createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ProfileColors.headingColor,
              fontSize: ResponsiveLayout.isSmallScreen(context) ? 22 : 25.0,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.0625,
              child: const Divider(
                color: Colors.white,
                thickness: 1.0,
              ),),
        ],
      ),
    );
  }
}
