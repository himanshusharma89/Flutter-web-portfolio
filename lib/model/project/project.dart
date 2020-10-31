import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class ProjectModel {
  final String URL;
  final String desc;
  final String imgURL;
  final int index;
  final String title;

  ProjectModel({this.URL, this.desc, this.imgURL, this.index, this.title});

  factory ProjectModel.fromSnapshot(Map<dynamic, dynamic> snapshot) => _$ProjectModelFromJson(snapshot);
}
