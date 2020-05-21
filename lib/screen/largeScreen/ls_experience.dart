import 'package:flutter/material.dart';

class Experience_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "EXPERIENCE",
          style: TextStyle(
            fontFamily: "Poppins",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:200.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _experience(
                context: context,
                imgUrl: 'assets/experience/gssoc.png',
                name: 'GSSOC\'20 Participant',
                organisation: 'GIRLSCRIPT',
                date: '03/20 to Present',
                description: 'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.'
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              _experience(
                context: context,
                imgUrl: 'assets/experience/jwoc.jfif',
                name: 'JWOC Participant',
                organisation: 'JGEC Winter Of Code',
                date: '01/20 to 02/2020',
                description: 'Ranked 5th as a top contributor to Open Source projects on GitHub as a \nparticipant of JwoC (JGEC Winter of Code).'
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              _experience(
                context: context,
                imgUrl: 'assets/experience/google.png',
                name: 'Build for Digital India Trainee',
                organisation: 'GOOGLE',
                date: '10/19 to 01/2020',
                description: 'Got selected as a ChangeMaker and developed a mobile application using \nFlutter and Dart and with Firebase and Google Cloud Platform Places API, under \nBuild For Digital India program.'
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              _experience(
                context: context,
                imgUrl: 'assets/experience/QSwhite.png',
                name: 'Flutter Developer',
                organisation: 'QUICKSTAY',
                date: '12/19 to Present',
                description: 'Developing a mobile application, using Flutter with Dart and Firebase as a \nbackend for authentication and storage of user data for the startup QuickStay.'
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              _experience(
                context: context,
                imgUrl: 'assets/experience/ieee.png',
                name: 'Content Writer',
                organisation: 'IEEE CIET STUDENT BRANCH',
                date: '05/19 to Present',
                description: 'Created content for various events like Workshops, Hackathons, Expert Talk, and \nOrientation Program for freshers organised by IEEE CIET Student Branch.'
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              _experience(
                context: context,
                imgUrl: 'assets/social/gfg2.png',
                name: 'Campus Ambassador',
                organisation: 'GEEKSFORGEEKS',
                date: '06/19 to Present',
                description: 'Organizing and managing GeeksforGeeks presence in college fests and other \ntechnical events, and involving students from first to a final year to actively \nparticipate in GeeksforGeeks activities and contributions.'
              ),
            ],
          ),
        ),
        SizedBox(height: 80.0,),
      ],
    );
  }
  Widget _experience({BuildContext context,String imgUrl,String name, String organisation, String date, String description}){
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
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
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                imgUrl,
                width: 150.0,
                height: 150.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        organisation,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
              // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
            ],
          ),
        ),
      ),
    );
  }
}