import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/model/experience/expereince.dart';

class ExperienceProvider with ChangeNotifier{
  List<ExperienceModel> experience = [];

  Future<List<ExperienceModel>> getExperience() async {
    List<QueryDocumentSnapshot> _ = await FirebaseFirestore.instance
        .collection('experience')
        .get()
        .then((e) => e.docs);

    _.forEach((event) {
      this.experience.add(ExperienceModel.fromSnapshot(event.data()));
    });
    notifyListeners();
    return experience;
  }
}