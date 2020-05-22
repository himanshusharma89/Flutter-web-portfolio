// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

class Project_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 130),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _project(
                    context: context,
                    url: 'https://github.com/himanshusharma89/Flutter-Blog-App',
                    imgUrl:'assets/flutter1.png', 
                    name: 'FLUTTER BLOG APP', 
                    description: 'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.' 
                  ),
                  // SizedBox(width: 120.0,),
                  _project(
                    context: context,
                    url: 'https://github.com/himanshusharma89/Way-Back-Home',
                    imgUrl:'assets/flutter1.png', 
                    name: 'WAY BACK HOME', 
                    description: 'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google' 
                  ),
                  _project(
                    context: context,
                    url: 'https://github.com/himanshusharma89/TIET-Makeathon-2.0',
                    imgUrl:'assets/flutter1.png', 
                    name: 'WATER MONITORING SYSTEM', 
                    description: 'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.' 
                  ),
                ],
              ),
              SizedBox(height:70.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _project(
                    context: context,
                    url: 'https://github.com/himanshusharma89/Flutter-Blog-App',
                    imgUrl:'assets/flutter1.png', 
                    name: 'FLUTTER BLOG APP', 
                    description: 'This is a Blog App developed with Flutter Framework and Dart programming language. It is just a blog adding and saving application. This is a fully functional app with Firebase backend.' 
                  ),
                  // SizedBox(width: 120.0,),
                  _project(
                    context: context,
                    url: 'https://github.com/himanshusharma89/Way-Back-Home',
                    imgUrl:'assets/flutter1.png', 
                    name: 'WAY BACK HOME', 
                    description: 'This is a app which is under development, developed with Flutter Framework and Dart programming for BUILD FOR DIGITAL INDIA #BFDI initiative by Govt. and Google' 
                  ),
                  _project(
                    context: context,
                    url: 'https://github.com/himanshusharma89/TIET-Makeathon-2.0',
                    imgUrl:'assets/flutter1.png', 
                    name: 'WATER MONITORING SYSTEM', 
                    description: 'Water​ ​Monitoring​ ​System​ ​is​ ​an​ ​IOT​ ​based​ ​Flutter​ Project ​that​ ​has mechanisms​ ​to​ ​keep​ ​the​ ​user​ ​alerted​ ​in​ ​case​ ​of​ ​liquid​ ​overflow​. Developed for Makeathon 2.0 @ TIET.' 
                  ),
                  // SizedBox(width: 120.0,),
                  // _project(
                  //   context: context,
                  //   url: 'https://github.com/himanshusharma89/Flutter-Card-Carousel',
                  //   imgUrl:'assets/flutter.png', 
                  //   name: 'FLUTTER CARD CAROUSEL TEMPLATE', 
                  //   description: 'This is template for creating card carousel in Flutter with the help of carousel_slider package' 
                  // ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height:height*0.12),
      ],
    );
  }

  Widget _project({BuildContext context,String url,String imgUrl,String name, String description}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      width: width*0.2,
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
              Image.asset(
                imgUrl,
                height: height*0.15,
                width: width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: height*0.01,),
                    Text(
                      name,
                      style: TextStyle(
                        color: Color.fromRGBO(178, 190, 205,1),
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color.fromRGBO(178, 190, 205,1),
                        fontSize: 14.0,
                        fontFamily: "Poppins"
                      ),
                    )
                  ],
                ),
              ),
            ],
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