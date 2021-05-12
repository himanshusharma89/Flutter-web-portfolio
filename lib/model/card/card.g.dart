// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return CardModel(
      url: json['URL'] as String?,
      desc: json['desc'] as String,
      imgURL: json['imgURL'] as String,
      isActive: json['isActive'] as bool?,
      org: json['org'] as String?,
      title: json['title'] as String,
      startAt: json['startAt'] as Timestamp,
      endAt: json['endAt'] as Timestamp?,
      projectLink: json['projectLink'] as String?);
}
