import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/profile_theme.dart';
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
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1/0.4
                  ), 
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
                  }
                )
              )
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
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
            )
          ],
        ),
      );
    }
  }

  Widget _experience({BuildContext context,String imgUrl,String name, String organisation, String date, String description}){
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return TranslateOnHover(
      child: HandCursor(
        child: Container(
          width: ResponsiveLayout.isSmallScreen(context) ? width*0.56: width*0.25,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Color(0xff2a2e35),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                fit: StackFit.expand,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: ResponsiveLayout.isSmallScreen(context) ? Alignment.topCenter : Alignment.centerRight,
                    widthFactor: ResponsiveLayout.isSmallScreen(context) ? 1 : 0.3,
                    heightFactor: ResponsiveLayout.isSmallScreen(context) ? 0.3 : 1,
                    child: Image.asset(
                      imgUrl,
                      height: height*0.15,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: ResponsiveLayout.isSmallScreen(context) ? Alignment.bottomCenter : Alignment.centerLeft,
                    widthFactor: ResponsiveLayout.isSmallScreen(context) ? 1 : 0.5,
                    heightFactor: ResponsiveLayout.isSmallScreen(context) ? 0.65 : 1,
                    child: Column(
                      mainAxisAlignment: ResponsiveLayout.isSmallScreen(context) ? MainAxisAlignment.start : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 15.0,
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
                            fontSize: 12.0,
                            color: Color.fromRGBO(178, 190, 205,1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}