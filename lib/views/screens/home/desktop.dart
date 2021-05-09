import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/current_index.dart';
import '../../../views/screens/about_me.dart';
import '../../../views/screens/experience.dart';
import '../../../views/screens/me.dart';
import '../../../views/screens/project.dart';
import '../../../views/screens/skills.dart';

class DesktopWidget extends StatefulWidget {
  const DesktopWidget({this.controller, Key? key}) : super(key: key);
  final PageController? controller;
  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  late List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    homeList = const <Widget>[
      Me(),
      AboutMe(),
      Skills(),
      Experience(),
      Project()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
