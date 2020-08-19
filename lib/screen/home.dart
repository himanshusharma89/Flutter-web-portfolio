import 'package:flutter/material.dart';
import 'package:my_portfolio/provider/drawer_controller.dart';
import 'package:my_portfolio/screen/article.dart';
import 'package:my_portfolio/screen/about_me.dart';
import 'package:my_portfolio/screen/drawer.dart';
import 'package:my_portfolio/screen/experience.dart';
import 'package:my_portfolio/screen/footer.dart';
import 'package:my_portfolio/screen/me.dart';
import 'package:my_portfolio/screen/project.dart';
import 'package:my_portfolio/screen/skills.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final PageController controller;
  final int currentIndex;
  Home({this.controller,this.currentIndex});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(controller: widget.controller,),
      smallScreen: SmallChild(controller: widget.controller),
    );
  }
}

List socialPlatforms = [
  {
    'URL':'https://github.com/himanshusharma89',
    'iconURL':'https://img.icons8.com/fluent/50/000000/github.png'
  },
  {
    'URL':'https://twitter.com/_SharmaHimanshu',
    'iconURL':'https://img.icons8.com/color/48/000000/twitter.png'
  },
  {
    'URL':'https://www.linkedin.com/in/himanshusharma89/',
    'iconURL':'https://img.icons8.com/color/48/000000/linkedin.png'
  },
  {
    'URL':'https://stackoverflow.com/users/11545939/himanshu-sharma',
    'iconURL':'https://img.icons8.com/color/48/000000/stackoverflow.png'
  },
  {
    'URL':'https://codepen.io/himanshusharma89',
    'iconURL':'https://img.icons8.com/ios-filled/50/000000/codepen.png'
  },
];

class LargeChild extends StatefulWidget {
  final PageController controller;
  int currentIndex;
  LargeChild({this.controller,this.currentIndex});
  
  @override
  _LargeChildState createState() => _LargeChildState();
}

class _LargeChildState extends State<LargeChild> {

  PageController controller;
  ItemPositionsListener itemPositionsListener;
  bool visibleFAB=true;
  List<Widget> homeList;

  @override
  void initState() {
    super.initState();
    itemPositionsListener=ItemPositionsListener.create();
    controller=widget.controller;
    homeList=[
      Me(),
      AboutMe(),
      Skills(),
      Experience(),
      Project(),
      Article(),
      // Footer_LS(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width*0.96,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            itemCount: homeList.length, 
            itemBuilder: (context,index){
              return homeList[index];
            },
            onPageChanged: (int index){
              setState(() {
                widget.currentIndex=index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                heroTag: null,
                onPressed: (){
                },
                child: Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: width*0.035,
              height: height*0.32,
              decoration: BoxDecoration(
                color: ProfileTheme.navBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(5.0, 20.0),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Center(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: socialPlatforms.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: HandCursor(
                        child: GestureDetector(
                          onTap: () {
                            _launchURL(socialPlatforms[index]['URL']);
                          },
                          child: Image.network(
                            socialPlatforms[index]['iconURL'],
                            width: 30.0,
                            height: 30.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: ValueListenableBuilder<Iterable<ItemPosition>>(
          //       valueListenable: itemPositionsListener.itemPositions,
          //       builder: (context, positions, child) {
          //         int min;
          //         int max;
          //         if (positions.isNotEmpty) {
          //           min = positions
          //               .where((ItemPosition position) => position.itemTrailingEdge > 0)
          //               .reduce((ItemPosition min, ItemPosition position) =>
          //                 position.itemTrailingEdge < min.itemTrailingEdge
          //                   ? position
          //                   : min)
          //               .index;
          //           max = positions
          //               .where((ItemPosition position) => position.itemLeadingEdge < 1)
          //               .reduce((ItemPosition max, ItemPosition position) =>
          //                 position.itemLeadingEdge > max.itemLeadingEdge
          //                   ? position
          //                   : max)
          //               .index;
          //         }
          //         if(min==0){
          //           return Container();
          //         } else {
          //           return FloatingActionButton(
          //             backgroundColor: widget.darkmode? Color.fromRGBO(42, 46, 53, 1): Colors.white,
          //             heroTag: null,
          //             onPressed: (){
          //               // controller.scrollTo(
          //               //   index: 0,
          //               //   duration: Duration(milliseconds: 500),
          //               //   curve: Curves.easeInOutQuart,
          //               // );
          //             },
          //             child: Icon(
          //               Icons.keyboard_arrow_up,
          //               color: widget.darkmode? Colors.white: Color.fromRGBO(42, 46, 53, 1),
          //             ),
          //           );
          //         }
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class SmallChild extends StatefulWidget {
  final PageController controller;
  SmallChild({this.controller});
  @override
  _SmallChildState createState() => _SmallChildState();
}

class _SmallChildState extends State<SmallChild> with TickerProviderStateMixin{

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
      children: [
        drawerScreen(),
        homeScreen()
      ],
    );
  }

  Widget drawerScreen(){
    return Container(
      child: Scaffold(
        body: DrawerScreen(context),
      ),
    );
  }

  Widget homeScreen(){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return zoomAndSlideContent(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: width,
          height: height,
          color: ProfileTheme.backgroundColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Me(),
                    SizedBox(height:80.0),
                    AboutMe(),
                    SizedBox(height:80.0),
                    Skills(),
                    Experience(),
                    Project(),
                    SizedBox(height: 80.0,),// GAP
                    Article(),
                    Footer(),
                    SizedBox(height:80.0)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  child: FittedBox(
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                      onPressed: (){
                        _handleOnPressed();
                        Provider.of<MenuController>(context, listen: false).toggle();
                      },
                      heroTag: null,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
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

    final slideAmount = 275.0 * slidePercent;
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

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}