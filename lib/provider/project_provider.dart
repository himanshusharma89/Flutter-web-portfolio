import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/project/project.dart';

class ProjectProvider with ChangeNotifier {
  List<ProjectModel> project = <ProjectModel>[];

  Future<List<ProjectModel>> getProjects() async {
    final _ = await FirebaseFirestore.instance
        .collection('projects')
        .orderBy('startAt')
        .get()
        .then((QuerySnapshot e) => e.docs);

    _.forEach((QueryDocumentSnapshot event) {
      project.add(ProjectModel.fromSnapshot(event.data()));
    });
    notifyListeners();
    return project;
  }
}
