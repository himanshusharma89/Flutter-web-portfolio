import 'package:json_annotation/json_annotation.dart';

part 'expereince.g.dart';

@JsonSerializable()
class ExperienceModel {
  final String URL;
  final String date;
  final String desc;
  final String imgURL;
  final bool isActive;
  final String org;
  final String title;

  ExperienceModel(
      {this.URL,
      this.date,
      this.desc,
      this.imgURL,
      this.isActive,
      this.org,
      this.title});

  factory ExperienceModel.fromSnapshot(Map<dynamic, dynamic> snapshot) =>
      _$ExperienceModelFromJson(snapshot);
}
