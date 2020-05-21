import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/dashedLine.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Hello! ",
                              style: TextStyle(
                                fontSize: 30,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: Colors.white
                              )
                            ),
                            Text(
                              "My name is ",
                              style: TextStyle(
                                fontSize: 30, 
                                color: Colors.white,
                                fontFamily: "Poppins"
                              ),
                            )
                          ],
                        ),
                        Text(
                          "HIMANSHU SHARMA",
                          style: TextStyle(
                            letterSpacing: 0.2,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                                  fontSize: 18.0,
                                  fontFamily: "Poppins",
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
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Container(
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
                ),
              ],
            ),
          ),
          SizedBox(height:50.0),
          MySeparator(color: Colors.white,),
          SizedBox(height:50.0),
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
                        fontSize: 25.0,
                        fontFamily: "Poppins"
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.asset('assets/flutter.png',
                        width: 90.0,
                      )
                    ).moveUpOnHover,
                    Text(
                      " FLUTTER DEVELOPER",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "Poppins"
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
      ],
    );
  }
}