import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

import '../helpers/constants.dart';

class PageTitle extends StatefulWidget {
  const PageTitle({@required this.title});
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
              color: ProfileColors.cardHeadingColor,
              fontSize: ResponsiveLayout.isSmallScreen(context) ? 20 : 25.0,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.0625,
              child: const Divider(
                color: Colors.white,
                thickness: 1.0,
              )),
        ],
      ),
    );
  }
}
