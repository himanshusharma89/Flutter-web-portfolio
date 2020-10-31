// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expereince.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) {
  return ExperienceModel(
    URL: json['URL'] as String,
    date: json['date'] as String,
    desc: json['desc'] as String,
    imgURL: json['imgURL'] as String,
    isActive: json['isActive'] as bool,
    org: json['org'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'URL': instance.URL,
      'date': instance.date,
      'desc': instance.desc,
      'imgURL': instance.imgURL,
      'isActive': instance.isActive,
      'org': instance.org,
      'title': instance.title,
    };
