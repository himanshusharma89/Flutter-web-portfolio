import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/card/card.dart';

class ExperienceProvider with ChangeNotifier {
  List<CardModel> experience = <CardModel>[];

  Future<List<CardModel>> getExperience() async {
    final _ = await FirebaseFirestore.instance
        .collection('experience')
        .orderBy('startAt', descending: true)
        .get()
        .then((QuerySnapshot e) => e.docs);

    _.forEach((QueryDocumentSnapshot event) {
      experience
          .add(CardModel.fromSnapshot(event.data()! as Map<String, dynamic>));
    });
    notifyListeners();
    return experience;
  }
}
