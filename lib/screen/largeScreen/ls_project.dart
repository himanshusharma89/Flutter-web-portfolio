// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Project_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Column(
            children: <Widget>[
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
                  fontFamily: "Poppins",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _project(
                    url: 'https://github.com/himanshusharma89/Flutter-Blog-App',
                    imgUrl:'assets/flutter.png', 
                    name: 'FLUTTER BLOG APP', 
                    description: 'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.' 
                  ),
                  SizedBox(width: 120.0,),
                  _project(
                    url: 'https://github.com/himanshusharma89/Way-Back-Home',
                    imgUrl:'assets/flutter.png', 
                    name: 'WAY BACK HOME', 
                    description: 'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google' 
                  ),
                ],
              ),
              SizedBox(height:70.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _project(
                    url: 'https://github.com/himanshusharma89/TIET-Makeathon-2.0',
                    imgUrl:'assets/flutter.png', 
                    name: 'WATER MONITORING SYSTEM', 
                    description: 'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.' 
                  ),
                  SizedBox(width: 120.0,),
                  _project(
                    url: 'https://github.com/himanshusharma89/Flutter-Card-Carousel',
                    imgUrl:'assets/flutter.png', 
                    name: 'FLUTTER CARD CAROUSEL TEMPLATE', 
                    description: 'This is template for creating card carousel in Flutter with the help of carousel_slider package' 
                  ),
                ],
              ),
              SizedBox(height:100.0),
              SizedBox(height: 80.0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _project({String url,String imgUrl,String name, String description}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
      ),
      width: 300.0,
      height:510.0,
      child: GestureDetector(
        onTap: () {
          _launchURL(url);
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
                    imgUrl,
                    width: 150.0,
                  ),
                ),
                SizedBox(height:30.0),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"
                  ),
                ),
                SizedBox(height:30.0),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "Poppins"
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ).showCursorOnHover.moveUpOnHover;
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