// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return ProjectModel(
    URL: json['URL'] as String,
    desc: json['desc'] as String,
    imgURL: json['imgURL'] as String,
    index: json['index'] as int,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'URL': instance.URL,
      'desc': instance.desc,
      'imgURL': instance.imgURL,
      'index': instance.index,
      'title': instance.title,
    };
