import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/views/screens/about_me.dart';
import 'package:my_portfolio/views/screens/experience.dart';
import 'package:my_portfolio/views/screens/me.dart';
import 'package:my_portfolio/views/screens/project.dart';
import 'package:my_portfolio/views/screens/skills.dart';
import 'package:provider/provider.dart';

class DesktopWidget extends StatefulWidget {
  const DesktopWidget({this.controller});
  final PageController? controller;
  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  late List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    homeList = <Widget>[
      Me(),
      AboutMe(),
      Skills(),
      Experience(),
      Project()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      width: width,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
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
