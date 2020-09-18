// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medium_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediumFeed _$MediumFeedFromJson(Map<String, dynamic> json) {
  return MediumFeed(
    url: json['url'] as String,
    title: json['title'] as String,
    link: json['link'] as String,
    author: json['author'] as String,
    description: json['description'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$MediumFeedToJson(MediumFeed instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'link': instance.link,
      'author': instance.author,
      'description': instance.description,
      'image': instance.image,
    };
