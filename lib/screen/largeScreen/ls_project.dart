// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Project_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height:height*0.05),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     RotateAnimatedTextKit(
          //       totalRepeatCount: 1000,
          //       text: ["CODE", "DEBUG", "ANALYZE", "DESIGN"],
          //       textStyle: TextStyle(
          //         fontSize: 40.0, 
          //         fontFamily: "Star Jedi",
          //         color: Colors.white
          //       ),
          //       textAlign: TextAlign.start,
          //       alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          //     ),
          //   ],
          // ),
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
          Container(
            height: height*0.82,
            width: width,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: ResponsiveLayout.isMediumScreen(context) ? 1.5/0.8 : 0.8/0.6
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: _project(
                      context: context,
                      url: projects[index]['url'],
                      imgUrl: projects[index]['imgUrl'],
                      name: projects[index]['name'],
                      description: projects[index]['description']
                    ),
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _project({BuildContext context,String url,String imgUrl,String name, String description}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return TranslateOnHover(
      child: HandCursor(
        child: Container(
          width: width*0.25,
          height: height*0.48,
          child: GestureDetector(
            onTap: () {
              _launchURL(url);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: Color(0xff2a2e35),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: height*0.01,),
                        Text(
                          name,
                          style: TextStyle(
                            color: Color.fromRGBO(178, 190, 205,1),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height*0.01,),
                        Text(
                          description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromRGBO(178, 190, 205,1),
                            fontSize: 15.0,
                          ),
                        )
                      ],
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

_launchURL(String Url) async {
  var url = Url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  List projects=[
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
];