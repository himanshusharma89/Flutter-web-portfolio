import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/profile_theme.dart';
import 'package:my_portfolio/utilities/card.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/title.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  Stream<QuerySnapshot> experience;

  @override
  void initState() {
    experience=firebaseFirestore.collection('experience').orderBy('isActive', descending: true).snapshots();
    super.initState();
  }
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
                    stream: experience,
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
                                child: TranslateOnHover(
                                  child: CardView(
                                    title: getExperience['title'],
                                    imgURL: getExperience['imgURL'],
                                    imgAlignment: Alignment.centerLeft,
                                    url: getExperience['URL'],
                                    date: getExperience['date'],
                                    desc: getExperience['desc'],
                                    org: getExperience['org'],
                                    trailingIcon: true,
                                    trailingIconData: Icons.launch_rounded,
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: ProfileTheme.backgroundColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
          child: Column(
            children: <Widget>[
              PageTitle(title: 'Expereince'),
              SizedBox(height: 10.0),
              StreamBuilder(
                  stream: experience,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot experience =
                              snapshot.data.docs[index];
                          Map getExperience = experience.data();
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: CardView(
                              title: getExperience['title'],
                              imgURL: getExperience['imgURL'],
                              imgAlignment: Alignment.centerLeft,
                              url: getExperience['URL'],
                              date: getExperience['date'],
                              desc: getExperience['desc'],
                              org: getExperience['org'],
                              trailingIcon: true,
                              trailingIconData: Icons.launch_rounded,
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                          child: Container(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()));
                    }
                  })
            ],
          ),
        ),
      );
    }
  }
}
