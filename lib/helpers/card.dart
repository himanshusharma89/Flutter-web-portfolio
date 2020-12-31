import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/helpers/responsiveLayout.dart';

import '../main.dart';
import '../profile_colors.dart';

class CardView extends StatefulWidget {
  final String title;
  final String date;
  final String desc;
  final String org;
  final String imgURL;
  final Alignment imgAlignment;
  final bool trailingIcon;
  final IconData trailingIconData;
  final String url;

  CardView(
      {@required this.title,
      @required this.imgURL,
      @required this.url,
      @required this.imgAlignment,
      @required this.trailingIcon,
      this.date,
      this.desc,
      this.org,
      this.trailingIconData = Icons.launch_rounded});
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        height: height * 0.1,
        width: ResponsiveLayout.isSmallScreen(context)
            ? width * 0.56
            : width * 0.25,
        // height: height*0.48,
        child: GestureDetector(
          onTap: () {
            launcher.launchURL(widget.url);
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Color(0xff2a2e35),
            child: Stack(
              fit: StackFit.expand,
              // fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.25,
                  alignment: widget.imgAlignment,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      widget.imgURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.75,
                  alignment: widget.imgAlignment == Alignment.centerLeft
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontSize:
                                        ResponsiveLayout.isSmallScreen(context)
                                            ? 13
                                            : 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(178, 190, 205, 1),
                                  ),
                                ),
                              ),
                              if (widget.org != null)
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Text(
                                    widget.org,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color.fromRGBO(178, 190, 205, 1),
                                    ),
                                  ),
                                ),
                              // SizedBox(
                              //   height: height * 0.01,
                              // ),
                              if (widget.desc != null)
                                Expanded(
                                  child: Text(
                                    widget.desc,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color.fromRGBO(178, 190, 205, 1),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (widget.trailingIcon)
                          IconButton(
                              icon: Icon(
                                widget.trailingIconData,
                                color: ProfileColors.navbarItemColor,
                                size: 15,
                              ),
                              onPressed: () {
                                launcher.launchURL(widget.url);
                              })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
