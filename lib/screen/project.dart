import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/launcher.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

final Launcher launcher = Launcher();
class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {

  List projects=[];

  @override
  void initState() {
    super.initState();
    projects=[
      {
        'url': 'https://github.com/himanshusharma89/Flutter-Blog-App',
        'imgUrl':'assets/flutter1.png', 
        'name': 'FLUTTER BLOG APP', 
        'description': 'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.' 
      },
      {
        'url': 'https://github.com/himanshusharma89/Way-Back-Home',
        'imgUrl':'assets/flutter1.png', 
        'name': 'WAY BACK HOME', 
        'description': 'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google' 
      },
      {
        'url': 'https://github.com/himanshusharma89/TIET-Makeathon-2.0',
        'imgUrl':'assets/flutter1.png', 
        'name': 'WATER MONITORING SYSTEM', 
        'description': 'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.' 
      },
      {
        'url': 'https://github.com/himanshusharma89/Flutter-Blog-App',
        'imgUrl':'assets/flutter1.png', 
        'name': 'FLUTTER BLOG APP', 
        'description': 'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.' 
      },
      {
        'url': 'https://github.com/himanshusharma89/Way-Back-Home',
        'imgUrl':'assets/flutter1.png', 
        'name': 'WAY BACK HOME', 
        'description': 'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google' 
      },
      {
        'url': 'https://github.com/himanshusharma89/TIET-Makeathon-2.0',
        'imgUrl':'assets/flutter1.png', 
        'name': 'WATER MONITORING SYSTEM', 
        'description': 'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.' 
      },
      {
        'url': 'https://github.com/himanshusharma89/TIET-Makeathon-2.0',
        'imgUrl':'assets/flutter1.png', 
        'name': 'WATER MONITORING SYSTEM', 
        'description': 'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.' 
      },
    ];
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height:height*0.05),
            Text(
              "PROJECTS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ProfileTheme.cardHeadingColor,
                fontSize: 35.0,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.0625,
              child: Divider(
                color: Colors.white,
                thickness: 3.0,
              )
            ),
            SizedBox(height:height*0.01),
            Center(
              child: Container(
                height: height*0.83,
                width: width*0.82,
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 6,
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index.isEven ? 3 : 2),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _project(
                        context: context,
                        url: projects[index]['url'],
                        imgUrl: projects[index]['imgUrl'],
                        name: projects[index]['name'],
                        description: projects[index]['description']
                      )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
              StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 4,
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(2, index.isEven ? 3 : 2),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _project(
                        context: context,
                        url: projects[index]['url'],
                        imgUrl: projects[index]['imgUrl'],
                        name: projects[index]['name'],
                        description: projects[index]['description']
                      )
                    );
                  },
                ),
            ],
          ),
        ),
      );
    }
  }

  Widget _project({BuildContext context,String url,String imgUrl,String name, String description}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return TranslateOnHover(
      child: HandCursor(
        child: Container(
          width: ResponsiveLayout.isSmallScreen(context) ? width*0.56: width*0.25,
          // height: height*0.48,
          child: GestureDetector(
            onTap: () {
              launcher.launchURL(url);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color(0xff2a2e35),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 0.35,
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 0.65,
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Color.fromRGBO(178, 190, 205,1),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.02,),
                          Expanded(
                            child: Text(
                              description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(178, 190, 205,1),
                                fontSize: 14.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}