import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard(
      {Key key, this.description, this.title, this.date, this.org, this.imgURL})
      : super(key: key);
  final String description;
  final String title;
  final String date;
  final String org;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      // FadeInImage(
                      //   placeholder: AssetImage('assets/placeholder.gif'),
                      //   image: kIsWeb
                      //       ? NetworkImage(this.imgURL)
                      //       : CachedNetworkImage(imageUrl: this.imgURL),
                      // ),
                      Column(
                        children: <Widget>[Text('$org | $title')],
                      )
                    ],
                  ),
                  Text(
                    description.replaceAll('•', '\n•'),
                    style: const TextStyle(height: 1.25),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
