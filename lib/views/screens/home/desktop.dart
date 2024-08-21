import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/views/screens/about_me.dart';
import 'package:my_portfolio/views/screens/experience.dart';
import 'package:my_portfolio/views/screens/extra.dart';
import 'package:my_portfolio/views/screens/hero.dart' as hero;
import 'package:my_portfolio/views/screens/project.dart';
import 'package:my_portfolio/views/screens/skills.dart';
import 'package:provider/provider.dart';

class DesktopWidget extends StatefulWidget {
  const DesktopWidget({required this.controller, super.key});
  final PageController controller;
  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  late List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    homeList = const <Widget>[
      hero.Hero(),
      AboutMe(),
      Skills(),
      Experience(),
      Project(),
      Extra(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const PageScrollPhysics(),
      controller: widget.controller,
      itemCount: homeList.length,
      itemBuilder: (_, int index) => homeList[index],
      onPageChanged: (int index) => setState(() {
        Provider.of<CurrentPage>(context, listen: false)
            .setCurrentPage(index);
      }),
    );
  }
}
