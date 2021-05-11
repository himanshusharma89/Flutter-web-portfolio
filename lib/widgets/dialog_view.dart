import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/functions.dart';
import '../helpers/responsive_layout.dart';
import '../main.dart';

class DialogView extends StatelessWidget {
  const DialogView(
      {Key? key,
      this.description,
      this.title,
      this.org,
      this.imgURL,
      this.startAt,
      this.endAt,
      this.projectLink})
      : super(key: key);
  final String? description;
  final String? title;
  final String? org;
  final String? imgURL;
  final Timestamp? startAt;
  final Timestamp? endAt;
  final String? projectLink;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final children = <Widget>[
      FadeInImage.memoryNetwork(
          height: 100, placeholder: unit8ListPlaceholder, image: imgURL!),
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
            org == null ? title! : '$org | $title',
            style: TextStyle(fontSize: fontSize(context, 20)),
          ),
          if (startAt != null) ...<Widget>[
            const SizedBox(
              height: 5,
            ),
            Text(
              '${DateFormat.yMMM().format(startAt!.toDate())} - '
              '${endAt == null ? "Present" : DateFormat.yMMM().format(endAt!.toDate())} '
              '${projectLink != null ? "" : "| Remote Work"}',
              style: TextStyle(fontSize: fontSize(context, 18)),
            )
          ]
        ],
      )
    ];
    return ClipRect(
      child: BackdropFilter(
        filter: imageFilter,
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
                    description!.replaceAll('•', '\n•'),
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
                        child: ElevatedButton(
                          onPressed: () => launcher.launchURL(projectLink!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Project Link',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FadeInImage.memoryNetwork(
                                  height: 30,
                                  placeholder: unit8ListPlaceholder,
                                  image:
                                      'https://img.icons8.com/fluent/50/000000/github.png')
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
