import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/model/card/card.dart';

class ProjectProvider with ChangeNotifier {
  List<CardModel> project = <CardModel>[];

  Future<List<CardModel>> getProjects() async {
    final _ = await FirebaseFirestore.instance
        .collection('projects')
        .orderBy('startAt')
        .get()
        .then((QuerySnapshot e) => e.docs);

    _.forEach((QueryDocumentSnapshot event) {
      project.add(
          CardModel.fromSnapshot(event.data()! as Map<String, dynamic>));
    });
    notifyListeners();
    return project;
  }
}
