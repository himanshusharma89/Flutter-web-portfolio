import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class ProjectModel {
  ProjectModel({
    this.url,
    this.desc,
    this.imgURL,
    this.index,
    this.title,
    this.startAt,
    this.endAt,
    this.projectLink,
  });

  factory ProjectModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      _$ProjectModelFromJson(snapshot);
  final String url;
  final String desc;
  final String imgURL;
  final int index;
  final String title;
  final Timestamp startAt;
  final Timestamp endAt;
  final String projectLink;
}
