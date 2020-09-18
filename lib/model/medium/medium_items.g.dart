// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medium_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediumItems _$MediumItemsFromJson(Map<String, dynamic> json) {
  return MediumItems(
    title: json['title'] as String,
    pubDate: json['pubDate'] as String,
    link: json['link'] as String,
    guid: json['guid'] as String,
    author: json['author'] as String,
    thumbnail: json['thumbnail'] as String,
    description: json['description'] as String,
    categories: json['categories'] as List,
  );
}

Map<String, dynamic> _$MediumItemsToJson(MediumItems instance) =>
    <String, dynamic>{
      'title': instance.title,
      'pubDate': instance.pubDate,
      'link': instance.link,
      'guid': instance.guid,
      'author': instance.author,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'categories': instance.categories,
    };
