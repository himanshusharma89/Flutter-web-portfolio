import 'package:json_annotation/json_annotation.dart';

part 'expereince.g.dart';

@JsonSerializable()
class ExperienceModel {
  ExperienceModel(
      {this.url,
      this.date,
      this.desc,
      this.imgURL,
      this.isActive,
      this.org,
      this.title});

  factory ExperienceModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      _$ExperienceModelFromJson(snapshot);

  final String url;
  final String date;
  final String desc;
  final String imgURL;
  final bool isActive;
  final String org;
  final String title;
}
