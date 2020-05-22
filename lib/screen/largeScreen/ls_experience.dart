import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';

class Experience_LS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return FractionallySizedBox(
      child: Column(
        children: <Widget>[
          SizedBox(height:height*0.05),
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
            padding: (ResponsiveLayout.isMediumScreen(context)) ? const EdgeInsets.symmetric(horizontal:50.0) : const EdgeInsets.symmetric(horizontal:130.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _experience(
                      context: context,
                      imgUrl: 'assets/experience/gssoc.png',
                      name: 'GSSOC\'20 Participant',
                      organisation: 'GIRLSCRIPT',
                      date: '03/20 to Present',
                      description: 'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.'
                    ),
                    _experience(
                      context: context,
                      imgUrl: 'assets/experience/jwoc.jfif',
                      name: 'JWOC Participant',
                      organisation: 'JGEC Winter Of Code',
                      date: '01/20 to 02/2020',
                      description: 'Ranked 5th as a top contributor to Open Source projects on GitHub as a participant of JwoC (JGEC Winter of Code).'
                    ),
                    _experience(
                      context: context,
                      imgUrl: 'assets/experience/google.png',
                      name: 'Build for Digital India Trainee',
                      organisation: 'GOOGLE',
                      date: '10/19 to 01/2020',
                      description: 'Got selected as a ChangeMaker and developed a mobile application using Flutter and Dart and with Firebase and Google Cloud Platform Places API, under Build For Digital India program.'
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _experience(
                      context: context,
                      imgUrl: 'assets/experience/QSwhite.png',
                      name: 'Flutter Developer',
                      organisation: 'QUICKSTAY',
                      date: '12/19 to Present',
                      description: 'Developing a mobile application, using Flutter with Dart and Firebase as a backend for authentication and storage of user data for the startup QuickStay.'
                    ),
                    _experience(
                      context: context,
                      imgUrl: 'assets/experience/ieee.png',
                      name: 'Content Writer',
                      organisation: 'IEEE CIET STUDENT BRANCH',
                      date: '05/19 to Present',
                      description: 'Created content for various events like Workshops, Hackathons, Expert Talk, and Orientation Program for freshers organised by IEEE CIET Student Branch.'
                    ),
                    _experience(
                      context: context,
                      imgUrl: 'assets/social/gfg2.png',
                      name: 'Campus Ambassador',
                      organisation: 'GEEKSFORGEEKS',
                      date: '06/19 to Present',
                      description: 'Organizing and managing GeeksforGeeks presence in college fests and other technical events, and involving students from first to a final year to actively participate in GeeksforGeeks activities and contributions.'
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height:height*0.12),
        ],
      ),
    );
  }
  Widget _experience({BuildContext context,String imgUrl,String name, String organisation, String date, String description}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      width: width*0.2,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Color(0xff2a2e35),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  imgUrl,
                  height: height*0.15,
                ),
              ),
              SizedBox(height: height*0.01,),
              Text(
                name,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(178, 190, 205,1),
                ),
              ),
              Text(
                organisation,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromRGBO(178, 190, 205,1),
                ),
              ),
              SizedBox(height: height*0.01,),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(178, 190, 205,1),
                ),
              ),
              SizedBox(height: height*0.02,),
              Text(
                date,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromRGBO(178, 190, 205,1),
                ),
              ),
              // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
            ],
          ),
        ),
      ),
    );
  }
}