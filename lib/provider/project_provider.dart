import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/model/project/project.dart';

class ProjectProvider with ChangeNotifier{
  List<ProjectModel> project = [];

  Future<List<ProjectModel>> getProjects() async {
    List<QueryDocumentSnapshot> _ = await FirebaseFirestore.instance
        .collection('projects')
        .get()
        .then((e) => e.docs);

    _.forEach((event) {
      this.project.add(ProjectModel.fromSnapshot(event.data()));
    });
    notifyListeners();
    return project;
  }
}