import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/constants.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/view/screens/article.dart';
import 'package:my_portfolio/view/screens/about_me.dart';
import 'package:my_portfolio/view/drawer.dart';
import 'package:my_portfolio/view/screens/experience.dart';
import 'package:my_portfolio/view/screens/me.dart';
import 'package:my_portfolio/view/screens/project.dart';
import 'package:my_portfolio/view/screens/skills.dart';
import 'package:my_portfolio/helpers/page_indicator.dart';
import 'package:provider/provider.dart';

class MobileWidget extends StatefulWidget {
  const MobileWidget({this.controller});
  final PageController controller;

  @override
  _MobileWidgetState createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool isMenu;

  Curve scaleDownCurve = const Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = const Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = const Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = const Interval(0.0, 1.0, curve: Curves.easeOut);

  @override
  void initState() {
    super.initState();
    isMenu = false;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[drawerScreen(), homeScreen()],
    );
  }

  Widget drawerScreen() {
    return DrawerScreen();
  }

  Widget homeScreen() {
    return zoomAndSlideContent(
      Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
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
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: FittedBox(
                        child: FloatingActionButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                          backgroundColor: ProfileColors.navBarColor,
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

  Widget zoomAndSlideContent(Widget content) {
    double slidePercent = 0.0, scalePercent = 0.0;

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
        slidePercent = slideOutCurve.transform(double.parse(
            Provider.of<MenuController>(context, listen: true)
                .percentOpen
                .toString()));
        scalePercent = scaleDownCurve.transform(double.parse(
            Provider.of<MenuController>(context, listen: true)
                .percentOpen
                .toString()));
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(double.parse(
            Provider.of<MenuController>(context, listen: true)
                .percentOpen
                .toString()));
        scalePercent = scaleUpCurve.transform(double.parse(
            Provider.of<MenuController>(context, listen: true)
                .percentOpen
                .toString()));
        break;
    }

    final double slideAmount = 225.0 * num.parse(slidePercent.toString());
    final double contentScale = 1.0 - (0.2 * num.parse(scalePercent.toString()));
    final double cornerRadius = 16.0 *
        num.parse(Provider.of<MenuController>(context, listen: true)
            .percentOpen
            .toString());

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(cornerRadius), child: content),
      ),
    );
  }
}
