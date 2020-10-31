import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/current_index.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/view/screen/article.dart';
import 'package:my_portfolio/view/screen/about_me.dart';
import 'package:my_portfolio/view/screen/drawer.dart';
import 'package:my_portfolio/view/screen/experience.dart';
import 'package:my_portfolio/view/screen/me.dart';
import 'package:my_portfolio/view/screen/project.dart';
import 'package:my_portfolio/view/screen/skills.dart';
import 'package:my_portfolio/helpers/pageIndicator.dart';
import 'package:provider/provider.dart';

class DesktopWidget extends StatefulWidget {
  final PageController controller;
  DesktopWidget({this.controller});

  @override
  _DesktopWidgetState createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  // ItemPositionsListener itemPositionsListener;
  bool visibleFAB = true;
  List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    // itemPositionsListener=ItemPositionsListener.create();
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
        itemBuilder: (context, index) {
          return homeList[index];
        },
        onPageChanged: (int index) {
          setState(() {
            Provider.of<CurrentPage>(context, listen: false)
                .setCurrentPage(index);
          });
        },
      ),
    );
  }
}

class MobileWidget extends StatefulWidget {
  final PageController controller;

  MobileWidget({this.controller});
  @override
  _MobileWidgetState createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool isMenu;

  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();
    isMenu = false;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [drawerScreen(), homeScreen()],
    );
  }

  Widget drawerScreen() {
    return Container(
      child: DrawerScreen(context),
    );
  }

  Widget homeScreen() {
    return zoomAndSlideContent(
      Scaffold(
        body: Stack(
          children: [
            Center(
              child: Stack(
                children: [
                  PageView(
                    controller: widget.controller,
                    children: <Widget>[
                      Me(),
                      AboutMe(),
                      Skills(),
                      Experience(),
                      Project(),
                      Article(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: FittedBox(
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                          onPressed: () {
                            _handleOnPressed();
                            Provider.of<MenuController>(context, listen: false)
                                .toggle();
                          },
                          heroTag: null,
                          child: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: _animationController,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: PageIndicator(
                  pageController: widget.controller,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isMenu = !isMenu;
      isMenu ? _animationController.forward() : _animationController.reverse();
    });
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: true).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: true).percentOpen);
        break;
    }

    final slideAmount = 225.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: true).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }
}
