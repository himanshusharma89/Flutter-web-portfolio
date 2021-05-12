import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class CardModel {
  CardModel({
    required this.desc,
    required this.imgURL,
    required this.title,
    required this.startAt,
    this.url,
    this.isActive,
    this.org,
    this.endAt,
    this.projectLink,
  });

  factory CardModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      _$CardModelFromJson(snapshot);

  final String? url;
  final String desc;
  final String imgURL;
  final bool? isActive;
  final String? org;
  final String title;
  final Timestamp startAt;
  final Timestamp? endAt;
  final String? projectLink;
}
