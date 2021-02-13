import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/view/screens/article.dart';
import 'package:my_portfolio/view/screens/about_me.dart';
import 'package:my_portfolio/view/screens/experience.dart';
import 'package:my_portfolio/view/screens/me.dart';
import 'package:my_portfolio/view/screens/project.dart';
import 'package:my_portfolio/view/screens/skills.dart';
import 'package:provider/provider.dart';

class DesktopWidget extends StatefulWidget {
  const DesktopWidget({this.controller});
  final PageController controller;
  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    homeList = <Widget>[
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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      width: width * 0.95,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        controller: widget.controller,
        itemCount: homeList.length,
        itemBuilder: (_, int index) => homeList[index],
        onPageChanged: (int index) => setState(() {
          Provider.of<CurrentPage>(context, listen: false)
              .setCurrentPage(index);
        }),
      ),
    );
  }
}
