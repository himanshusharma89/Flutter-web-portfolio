import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/extensions/translateOnHover.dart';
import 'package:my_portfolio/utilities/card.dart';
import 'package:my_portfolio/utilities/launcher.dart';
import 'package:my_portfolio/utilities/responsiveLayout.dart';
import 'package:my_portfolio/utilities/title.dart';

import '../../profile_theme.dart';

final Launcher launcher = Launcher();
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  Stream<QuerySnapshot> project;

  @override
  void initState() {
    project = firebaseFirestore.collection('projects').orderBy('index', descending: false).snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 50),
            Center(child: PageTitle(title: "PROJECTS")),
            SizedBox(height: height * 0.01),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StreamBuilder(
                    stream: project,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: ResponsiveLayout.isMediumScreen(context) ? 2 : 3,
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 4.0,
                                  childAspectRatio: 1 / 0.2),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot projects =
                                snapshot.data.docs[index];
                            Map getProjects = projects.data();
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TranslateOnHover(
                                child: CardView(
                                  title: getProjects['title'],
                                  imgURL: getProjects['imgURL'],
                                  imgAlignment: Alignment.centerLeft,
                                  url: getProjects['URL'],
                                  desc: getProjects['desc'],
                                  trailingIcon: false,
                                ),
                              ),
                            );
                          },
                        );
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
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PageTitle(title: 'Projects'),
              SizedBox(height: 10.0),
              StreamBuilder(
                  stream: project,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: height - 140,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot projects = snapshot.data.docs[index];
                            Map getProjects = projects.data();
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CardView(
                                title: getProjects['title'],
                                imgURL: getProjects['imgURL'],
                                imgAlignment: Alignment.centerLeft,
                                url: getProjects['URL'],
                                desc: getProjects['desc'],
                                trailingIcon: false,
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                          child: Container(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator()));
                    }
                  }),
            ],
          ),
        ),
      );
    }
  }
}
