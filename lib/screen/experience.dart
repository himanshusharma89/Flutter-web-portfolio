import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/extensions/hoverExtensions.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';

List experience = [
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
  {
    'name': 'GSSOC\'20 Participant',
    'imgUrl': 'assets/experience/gssoc.png',
    'date': '03/20 to Present',
    'description':
        'Contributing to Open Source projects on GitHub as a participant of GSSOC 2020. Contributing to Open Source projects on GitHub as a participant of GSSOC 2020.',
    'organisation': 'GIRLSCRIPT'
  },
];

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: height * 0.05),
            Text(
              "WORK EXPERIENCE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ProfileTheme.cardHeadingColor,
                fontSize: 35.0,
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.0625,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                )),
            SizedBox(height: height * 0.01),
            Flexible(
                fit: FlexFit.loose,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 4,
                        childAspectRatio: ResponsiveLayout.isMediumScreen(context)
                          ? 1/0.2
                          : 1 / 0.15),
                    itemCount: experience.length,
                    shrinkWrap: true,
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
                    })),
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
                width: MediaQuery.of(context).size.width * 0.56,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                )),
            SizedBox(height: 30.0),
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

  Widget _experience(
      {BuildContext context,
      String imgUrl,
      String name,
      String organisation,
      String date,
      String description}) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return HandCursor(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: height * 0.07,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imgUrl,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            Expanded(
              // fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(178, 190, 205, 1),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      organisation,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(178, 190, 205, 1),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
                  Expanded(
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color.fromRGBO(178, 190, 205, 1),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
                  // Text(
                  //   date,
                  //   style: TextStyle(
                  //     fontSize: 12.0,
                  //     color: Color.fromRGBO(178, 190, 205, 1),
                  //   ),
                  // ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.launch_rounded,
                  color: ProfileTheme.navbarItemColor,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
