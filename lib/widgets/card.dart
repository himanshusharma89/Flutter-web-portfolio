import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../helpers/colors.dart';
import '../helpers/functions.dart';
import '../helpers/responsive_layout.dart';
import '../main.dart';
import '../widgets/dialog_view.dart';

class CardView extends StatefulWidget {
  const CardView(
      {required this.title,
      required this.imgURL,
      required this.url,
      required this.imgAlignment,
      required this.trailingIcon,
      this.desc,
      this.org,
      this.trailingIconData = Icons.launch_rounded,
      this.startAt,
      this.endAt,
      this.articleLink,
      this.projectLink,
      Key? key})
      : super(key: key);

  final String? title;
  final String? desc;
  final String? org;
  final String? imgURL;
  final Alignment imgAlignment;
  final bool trailingIcon;
  final IconData trailingIconData;
  final String? url;
  final Timestamp? startAt;
  final Timestamp? endAt;
  final String? articleLink;
  final String? projectLink;

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.1,
      width:
          ResponsiveLayout.isSmallScreen(context) ? width * 0.56 : width * 0.25,
      // height: height*0.48,
      child: InkWell(
        onTap: () => widget.articleLink != null
            ? launcher.launchURL(widget.articleLink!)
            : showDialog(
                context: context,
                builder: (_) => DialogView(
                  description: widget.desc,
                  title: widget.title,
                  imgURL: widget.imgURL,
                  org: widget.org,
                  startAt: widget.startAt,
                  endAt: widget.endAt,
                  projectLink: widget.projectLink,
                ),
              ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: ProfileColors.cardColor,
          child: Stack(
            fit: StackFit.expand,
            // fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.25,
                alignment: widget.imgAlignment,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FadeInImage.memoryNetwork(
                      placeholder: unit8ListPlaceholder, image: widget.imgURL!),
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
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                widget.title!,
                                style: TextStyle(
                                  fontSize: fontSize(context, 15),
                                  fontWeight: FontWeight.bold,
                                  color: ProfileColors.cardTextColor,
                                ),
                              ),
                            ),
                            if (widget.org != null)
                              Flexible(
                                child: Text(
                                  widget.org!,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: ProfileColors.cardTextColor,
                                  ),
                                ),
                              ),
                            // SizedBox(
                            //   height: height * 0.01,
                            // ),
                            if (widget.desc != null)
                              Expanded(
                                child: Text(
                                  widget.desc!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    color: ProfileColors.cardTextColor,
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
                              launcher.launchURL(widget.url!);
                            })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
