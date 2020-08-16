import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/utilities/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';

List experience=[
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
  {
    'name':'GSSOC\'20 Participant',
    'imgUrl':'assets/experience/gssoc.png',
    'date':'03/20 to Present',
    'description':'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation':'GIRLSCRIPT'
  },
];

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    if(ResponsiveLayout.isLargeScreen(context) || ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:height*0.05),
            Text(
              "WORK EXPERIENCE",
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
                  itemCount: experience.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _experience(
                        context: context,
                        name: experience[index]['name'],
                        imgUrl: experience[index]['imgUrl'],
                        date: experience[index]['date'],
                        description: experience[index]['description'],
                        organisation: experience[index]['organisation'],
                      ),
                    );
                  },
                ),
              )
            ),
          ],
        ),
      );
    } else {
      return Container(
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
      );
    }
  }
  Widget _experience({BuildContext context,String imgUrl,String name, String organisation, String date, String description}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      width: width*0.35,
      height: height*0.35,
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