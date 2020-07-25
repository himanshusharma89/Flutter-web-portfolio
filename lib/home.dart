import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/screen/largeScreen/ls_article.dart';
import 'package:my_portfolio/screen/largeScreen/ls_footer.dart';
import 'package:my_portfolio/screen/largeScreen/ls_about_me.dart';
import 'package:my_portfolio/screen/largeScreen/ls_experience.dart';
import 'package:my_portfolio/screen/largeScreen/ls_me.dart';
import 'package:my_portfolio/screen/largeScreen/ls_project.dart';
import 'package:my_portfolio/screen/largeScreen/ls_skills.dart';
import 'package:my_portfolio/navbar.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final PageController controller;
  bool darkmode;
  int currentIndex;
  GlobalKey<ScaffoldState> drawerkey;
  Home({this.controller,this.darkmode,this.drawerkey,this.currentIndex});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(controller: widget.controller,darkmode: widget.darkmode,),
      smallScreen: SmallChild(controller: widget.controller,darkmode: widget.darkmode,drawerkey: widget.drawerkey),
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
  bool darkmode;
  int currentIndex;
  LargeChild({this.controller,this.darkmode,this.currentIndex});
  
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
      Me_LS(),
      AboutMe_LS(),
      Skills_LS(),
      Experience_LS(),
      Project_LS(),
      Article_LS(),
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
                backgroundColor: widget.darkmode? Color.fromRGBO(42, 46, 53, 1): Colors.white,
                heroTag: null,
                onPressed: (){
                  setState(() {
                    widget.darkmode=false;
                  });
                },
                child: Icon(
                  Icons.wb_sunny,
                  color: widget.darkmode? Colors.white: Color.fromRGBO(42, 46, 53, 1),
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
  final bool darkmode;
  GlobalKey<ScaffoldState> drawerkey;
  SmallChild({this.controller,this.darkmode,this.drawerkey});
  @override
  _SmallChildState createState() => _SmallChildState();
}

class _SmallChildState extends State<SmallChild> {

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: widget.drawerkey,
      drawer: Drawer(
        child: Navbar(controller: widget.controller,darkmode: true,),
      ),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:40,right: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height:30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hello! ",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'My name is ',
                              style: TextStyle(
                                fontSize: 40, 
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: RichText(
                            text:TextSpan(
                              text: "H",
                              style: TextStyle(
                                letterSpacing: 0.2,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "IMANSHU ",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.normal,
                                    fontSize: 40.0
                                  )
                                ),
                                TextSpan(
                                  text: "S",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 50.0,
                                  )
                                ),
                                TextSpan(
                                  text: "HARMA",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    // fontWeight: FontWeight.normal
                                  )
                                )
                              ]
                            )
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TranslateOnHover(
                              child: DottedBorder(
                                dashPattern: [6, 4, 4, 6],
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "WELCOME TO MY PROFILE",
                                    style: TextStyle(
                                      color: Colors.white,
                                                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: TranslateOnHover(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network('https://avatars0.githubusercontent.com/u/44980497?s=460&u=b25b445a569e149aceb9257e95a17152b2683c09&v=4',
                                width: 400.0,
                              )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:80.0),
                  Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0,left: 10.0),
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "I AM A ",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 20.0,
                                                          ),
                          ),
                          TranslateOnHover(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60.0),
                              child: Image.asset('assets/flutter.png',
                                width: 80.0,
                              )
                            ),
                          ),
                          Text(
                            " FLUTTER DEVELOPER",
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 20.0,
                                                          ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left:10.0,right:10.0),
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:80.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "About Me",
                          style: TextStyle(
                            
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.125,
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:30.0,left:50.0,right: 50.0),
                          child: Text(
                            "Focused Computer Science major (9.84 CGPA) currently attending Chitkara University, with a aim to leverage a proven knowledge of competitive programming with C/C++ & Java, Flutter Application Development, and web designing skills. I am a content writer at IEEE CIET Branch, Open Source enthusiast and I also like to working on Alexa Skill and Google Assistant App development.\nI am a quick learner and frequently praised as hard-working by my peers",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 20.0,
                              
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:80.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "SKILLS",
                          style: TextStyle(
                            
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.125,
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          )
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CircularPercentIndicator(
                                      radius: 130.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.9,
                                      center: GestureDetector(
                                        onTap: () {
                                          _launchURL('https://sourcerer.io/himanshusharma89');
                                        },
                                        child: Image.asset(
                                          'assets/tech/c.png',
                                          width: 55.0,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.white24,
                                      progressColor: Colors.white,
                                    ),
                                    CircularPercentIndicator(
                                      radius: 130.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.6,
                                      center: GestureDetector(
                                        onTap: () {
                                          _launchURL('https://sourcerer.io/himanshusharma89');
                                        },
                                        child: Image.asset(
                                          'assets/tech/c++.png',
                                          width: 55.0,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.white24,
                                      progressColor: Colors.white,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CircularPercentIndicator(
                                      radius: 130.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.7,
                                      center: GestureDetector(
                                        onTap: () {
                                          _launchURL('https://sourcerer.io/himanshusharma89');
                                        },
                                        child: Image.asset(
                                          'assets/tech/java.png',
                                          width: 55.0,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.white24,
                                      progressColor: Colors.white,
                                    ),
                                    CircularPercentIndicator(
                                      radius: 130.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.9,
                                      center: GestureDetector(
                                        onTap: () {
                                          _launchURL('https://sourcerer.io/himanshusharma89');
                                        },
                                        child: Image.asset(
                                          'assets/tech/html.png',
                                          width: 50.0,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.white24,
                                      progressColor: Colors.white,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    CircularPercentIndicator(
                                      radius: 130.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.8,
                                      center: GestureDetector(
                                        onTap: () {
                                          _launchURL('https://sourcerer.io/himanshusharma89');
                                        },
                                        child: Image.asset(
                                          'assets/tech/css.png',
                                          width: 50.0,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.white24,
                                      progressColor: Colors.white,
                                    ),
                                    CircularPercentIndicator(
                                      radius: 130.0,
                                      animation: true,
                                      animationDuration: 1200,
                                      lineWidth: 15.0,
                                      percent: 0.8,
                                      center: GestureDetector(
                                        onTap: () {
                                          _launchURL('https://sourcerer.io/himanshusharma89');
                                        },
                                        child: Image.asset(
                                          'assets/tech/dart.png',
                                          width: 50.0,
                                        ),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.butt,
                                      backgroundColor: Colors.white24,
                                      progressColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "EXPERIENCE",
                        style: TextStyle(
                          
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.56,
                        child: Divider(
                          color: Colors.white,
                          thickness: 3.0,
                        )
                      ),
                      SizedBox(height:30.0),
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width*0.56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 6.0,
                                      color: Colors.black26
                                    )
                                  ]
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Image.asset(
                                          'assets/experience/gssoc.png',
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.055,),
                                        Text(
                                          'GSSOC\'20 Participant',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'GIRLSCRIPT',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.31,),
                                        Text(
                                          '03/20 to Present',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 6.0,
                                      color: Colors.black26
                                    )
                                  ]
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Image.asset(
                                          'assets/experience/jwoc.jfif',
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Text(
                                          'JWOC Participant',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'JGEC Winter Of Code',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                                        Text(
                                          '01/20 to 02/2020',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 6.0,
                                      color: Colors.black26
                                    )
                                  ]
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Image.asset(
                                          'assets/experience/google.png',
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Text(
                                          'Build for Digital India \nTrainee',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'GOOGLE',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                                        Text(
                                          '10/19 to 01/2020',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 6.0,
                                      color: Colors.black26
                                    )
                                  ]
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Image.asset(
                                          'assets/experience/QSwhite.png',
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Text(
                                          'Flutter Developer',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'QuickStay',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.32,),
                                        Text(
                                          '12/19 to Present',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 6.0,
                                      color: Colors.black26
                                    )
                                  ]
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Image.asset(
                                          'assets/experience/ieee.png',
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Text(
                                          'Content Writer',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'IEEE CIET STUDENT BRANCH',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.23,),
                                        Text(
                                          '05/19 to Present',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0.0, 3.0),
                                      blurRadius: 6.0,
                                      color: Colors.black26
                                    )
                                  ]
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Image.asset(
                                          'assets/social/gfg2.png',
                                          width: 150.0,
                                          height: 150.0,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                        Text(
                                          'Campus Ambassador',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'GEEKSFORGEEKS',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.28,),
                                        Text(
                                          '06/19 to Present',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey
                                          ),
                                        ),
                                        // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top:30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            focalRadius: 1.0,
                            colors: [ Colors.blueAccent,Colors.black]
                          )
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  RotateAnimatedTextKit(
                                    totalRepeatCount: 1000,
                                    text: ["CODE", "DEBUG", "ANALYZE", "DESIGN"],
                                    textStyle: TextStyle(
                                      fontSize: 55.0, 
                                      color: Colors.white
                                    ),
                                    textAlign: TextAlign.start,
                                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                                  ),
                                ],
                              ),
                              Text(
                                "PROJECTS",
                                style: TextStyle(
                                  
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                              width: MediaQuery.of(context).size.width*0.0625,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 3.0,
                                ),
                              ),
                              SizedBox(height:30.0),
                              Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.56,
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL('https://github.com/himanshusharma89/Flutter-Blog-App');
                                      },
                                      child: Card(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(height:10.0),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(80.0),
                                                child: Image.asset(
                                                  'assets/flutter.png',
                                                  width: 150.0,
                                                ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'FLUTTER BLOG APP',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                                                                  ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                                                                  ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:40.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.56,
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL('https://github.com/himanshusharma89/Way-Back-Home');
                                      },
                                      child: Card(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(height:10.0),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(80.0),
                                                child: Image.asset(
                                                  'assets/flutter.png',
                                                  width: 150.0,
                                                ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'WAY BACK HOME',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                                                                  ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                                                                  ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:40.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.56,
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL('https://github.com/himanshusharma89/TIET-Makeathon-2.0');
                                      },
                                      child: Card(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(height:10.0),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(80.0),
                                                child: Image.asset(
                                                  'assets/flutter.png',
                                                  width: 150.0,
                                                ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'WATER MONITORING SYSTEM',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Liquid​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​ ​or​ ​when​ ​tank​ ​depletes. This project was developed for Makeathon 2.0 @ TIET.',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:40.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.56,
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchURL('https://github.com/himanshusharma89/Flutter-Card-Carousel');
                                      },
                                      child: Card(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(height:10.0),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(80.0),
                                                child: Image.asset(
                                                  'assets/flutter.png',
                                                  width: 150.0,
                                                ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'FLUTTER CARD CAROUSEL TEMPLATE',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height:30.0),
                                              Text(
                                                'This is template for creating card carousel in Flutter with the help of carousel_slider package',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:100.0)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80.0,),// GAP
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "ARTICLES",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.0625,
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          )
                        ),
                        SizedBox(height:30.0),
                        Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.black,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.56,
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchURL('https://medium.com/@rageremix/how-to-create-card-carousel-in-flutter-979bc8ecf19');
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height:10.0),
                                            Image.asset(
                                              'assets/social/medium.png',
                                              width: 150.0,
                                            ),
                                            SizedBox(height:30.0),
                                            Text(
                                              'HOW TO CREATE CARD CAROUSEL IN FLUTTER?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:40.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.black,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.56,
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchURL('https://www.geeksforgeeks.org/blockchain-in-brief/');
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height:10.0),
                                            Image.asset(
                                              'assets/social/gfg1.png',
                                              width: 150.0,
                                            ),
                                            SizedBox(height:30.0),
                                            Text(
                                              'BLOCKCHAIN IN BRIEF?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:40.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.black,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.56,
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchURL('https://medium.com/@rageremix/my-story-of-app-development-with-flutter-dart-ed6b41cc8226');
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height:10.0),
                                            Image.asset(
                                              'assets/social/medium.png',
                                              width: 150.0,
                                            ),
                                            SizedBox(height:30.0),
                                            Text(
                                              'MY STORY OF APP DEVELOPMENT WITH FLUTTER & DART',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:80.0)
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10.0,left: 10.0),
                            child: Divider(
                              color: Colors.white,
                              thickness: 3.0,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "THIS WEBSITE IS CREATED WITH ",
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60.0),
                              child: Image.asset('assets/flutter.png',
                                width: 80.0,
                              )
                            ),
                            Text(
                              " FLUTTER WEB ❤",
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left:10.0,right:10.0),
                            child: Divider(
                              color: Colors.white,
                              thickness: 3.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:80.0)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  child: FittedBox(
                    child: FloatingActionButton(
                      backgroundColor: Color.fromRGBO(42, 46, 53, 1),
                      onPressed: (){
                        widget.drawerkey.currentState.openDrawer();
                      },
                      heroTag: null,
                      child: Icon(
                        Icons.menu,
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
}

_launchURL(String Url) async {
  var url = Url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}