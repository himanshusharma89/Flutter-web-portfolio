import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/dashedLine.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/text_animation.dart';

class Me_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height:height*0.03),
        Container(
          height: height*0.85,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.7,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TypingTextAnimation(
                          text: 'Hello! My name is ',
                          textStyle: TextStyle(
                            letterSpacing: 0.2,
                            fontSize: 30,
                            color: ProfileTheme.subHeadingColor,
                          ),
                        ),
                        FutureBuilder(
                          future: Future.delayed(Duration(milliseconds: 2000)),
                          builder: (BuildContext context,AsyncSnapshot snapshot) => snapshot.connectionState == ConnectionState.done
                            ? TypingTextAnimation(
                                text: 'HIMANSHU SHARMA',
                                textStyle: TextStyle(
                                  letterSpacing: 0.2,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            : Container()
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20.0),
                          child: DottedBorder(
                            dashPattern: [6, 4, 4, 6],
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "WELCOME TO MY PROFILE",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ).moveUpOnHover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  widthFactor: 0.6,
                  child: Stack(
                    children: [
                      Container(
                        margin: (ResponsiveLayout.isMediumScreen(context)) ? const EdgeInsets.only(top:150) : const EdgeInsets.only(top:100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(22.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15
                            )
                          ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset('self.jfif',),
                        ).moveUpOnHover
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height:height*0.1),
        MySeparator(color: Colors.grey,),
        SizedBox(height:height*0.12),
      ],
    );
  }

  Widget getName(){
    Future.delayed(Duration(milliseconds: 2000)).then((value){
      TypingTextAnimation(
        text: 'HIMANSHU SHARMA',
        textStyle: TextStyle(
          letterSpacing: 0.2,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }
}