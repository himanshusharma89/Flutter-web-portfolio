import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/helpers/responsive_layout.dart';

class DialogView extends StatelessWidget {
  const DialogView(
      {Key key,
      this.description,
      this.title,
      this.org,
      this.imgURL,
      this.startAt,
      this.endAt,
      this.projectLink})
      : super(key: key);
  final String description;
  final String title;
  final String org;
  final String imgURL;
  final Timestamp startAt;
  final Timestamp endAt;
  final String projectLink;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final List<Widget> children = <Widget>[
      FadeInImage(
          height: 100,
          placeholder: const AssetImage('assets/placeholder.gif'),
          image: NetworkImage(imgURL)),
      SizedBox(
        width: ResponsiveLayout.isSmallScreen(context) ? 0 : 10,
        height: ResponsiveLayout.isSmallScreen(context) ? 10 : 0,
      ),
      Column(
        crossAxisAlignment: ResponsiveLayout.isSmallScreen(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            org == null ? title : '$org | $title',
            style: TextStyle(fontSize: fontSize(context, 20)),
          ),
          if (startAt != null) ...<Widget>[
            const SizedBox(
              height: 5,
            ),
            Text(
              '${DateFormat.yMMM().format(startAt.toDate())} - ${endAt == null ? "Present" : DateFormat.yMMM().format(endAt.toDate())} ${projectLink != null ? "" : "| Remote Work"}',
              style: TextStyle(fontSize: fontSize(context, 18)),
            )
          ]
        ],
      )
    ];
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.6, sigmaY: 2.6),
        child: Dialog(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              padding: const EdgeInsets.all(12),
              decoration:
                  BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
              child: Column(
                crossAxisAlignment: ResponsiveLayout.isSmallScreen(context)
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (ResponsiveLayout.isSmallScreen(context))
                    Column(
                      children: children,
                    )
                  else
                    Row(
                      children: children,
                    ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    description.replaceAll('•', '\n•'),
                    style: TextStyle(
                        height: 1.25, fontSize: fontSize(context, 16)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (projectLink != null)
                    Center(
                      child: SizedBox(
                        width: ResponsiveLayout.isSmallScreen(context)
                            ? width * 0.5
                            : width * 0.15,
                        child: RaisedButton(
                          onPressed: () => launcher.launchURL(projectLink),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Project Link',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FadeInImage(
                                  height: 30,
                                  placeholder:
                                      AssetImage('assets/placeholder.gif'),
                                  image: NetworkImage(
                                      'https://img.icons8.com/fluent/50/000000/github.png'))
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              )),
        ),
      ),
    );
  }
}