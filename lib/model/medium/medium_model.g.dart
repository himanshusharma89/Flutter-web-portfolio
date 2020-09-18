// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medium_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediumModel _$MediumModelFromJson(Map<String, dynamic> json) {
  return MediumModel(
    status: json['status'] as String,
    feed: json['feed'] == null
        ? null
        : MediumFeed.fromJson(json['feed'] as Map<String, dynamic>),
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : MediumItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MediumModelToJson(MediumModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'feed': instance.feed,
      'items': instance.items,
    };
