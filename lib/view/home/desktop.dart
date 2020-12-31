import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/view/article.dart';
import 'package:my_portfolio/view/about_me.dart';
import 'package:my_portfolio/view/experience.dart';
import 'package:my_portfolio/view/me.dart';
import 'package:my_portfolio/view/project.dart';
import 'package:my_portfolio/view/skills.dart';
import 'package:provider/provider.dart';

class DesktopWidget extends StatefulWidget {
  final PageController controller;
  DesktopWidget({this.controller});

  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    homeList = [
      Me(),
      AboutMe(),
      Skills(),
      Experience(),
      Project(),
      Article(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width * 0.95,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        controller: widget.controller,
        itemCount: homeList.length,
        itemBuilder: (context, index) => homeList[index],
        onPageChanged: (int index) => setState(() {
          Provider.of<CurrentPage>(context, listen: false)
              .setCurrentPage(index);
        }),
      ),
    );
  }
}