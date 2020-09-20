import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/title.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 50),
            Center(child: PageTitle(title: "WORK EXPERIENCE")),
            SizedBox(height: height * 0.01),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: StreamBuilder(
                    stream:
                        firebaseFirestore.collection('experience').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 4,
                                    childAspectRatio:
                                        ResponsiveLayout.isMediumScreen(context)
                                            ? 1 / 0.22
                                            : 1 / 0.15),
                            itemCount: snapshot.data.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              DocumentSnapshot experience =
                                  snapshot.data.docs[index];
                              Map getExperience = experience.data();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _experience(
                                  context: context,
                                  name: getExperience['title'],
                                  imgUrl: getExperience['imgURL'],
                                  date: getExperience['date'],
                                  description: getExperience['desc'],
                                  organisation: getExperience['org'],
                                ),
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
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
                width: MediaQuery.of(context).size.width * 0.56,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                )),
            SizedBox(height: 30.0),
            StreamBuilder(
                stream: firebaseFirestore.collection('experience').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 4,
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(2, index.isEven ? 3 : 2),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot experience = snapshot.data.docs[index];
                        Map getExpereince = experience.data();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _experience(
                            context: context,
                            name: getExpereince['title'],
                            imgUrl: getExpereince['imgURL'],
                            date: getExpereince['date'],
                            description: getExpereince['desc'],
                            organisation: getExpereince['org'],
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Color(0xff2a2e35),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: height * 0.07,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
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
                    size: 15,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
