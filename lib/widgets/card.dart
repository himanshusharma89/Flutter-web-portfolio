import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../helpers/colors.dart';
import '../helpers/functions.dart';
import '../main.dart';
import '../widgets/dialog_view.dart';

class CardView extends StatefulWidget {
  const CardView(
      {required this.title,
      required this.imgURL,
      required this.url,
      required this.desc,
      required this.startAt,
      this.org,
      this.endAt,
      this.projectLink,
      Key? key})
      : super(key: key);

  final String title;
  final String desc;
  final String? org;
  final String imgURL;
  final String? url;
  final Timestamp startAt;
  final Timestamp? endAt;
  final String? projectLink;

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.125,
      child: InkWell(
        onTap: () => showDialog(
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
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.25,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FadeInImage.memoryNetwork(
                      placeholder: unit8ListPlaceholder, image: widget.imgURL),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.75,
                alignment: Alignment.centerRight,
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
                              flex: 2,
                              child: Text(
                                widget.title,
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
                            Flexible(
                              child: Text(
                                widget.desc,
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
                      IconButton(
                          icon: const Icon(
                            Icons.launch_rounded,
                            color: ProfileColors.dotOutlineColor,
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
