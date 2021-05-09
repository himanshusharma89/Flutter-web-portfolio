import 'package:json_annotation/json_annotation.dart';

part 'medium_items.g.dart';

@JsonSerializable()
class MediumItems {
  MediumItems(
      {this.title,
      this.pubDate,
      this.link,
      this.guid,
      this.author,
      this.thumbnail,
      this.description,
      // this.content,
      this.categories});

  factory MediumItems.fromJson(Map<String, dynamic> parsedJson) =>
      _$MediumItemsFromJson(parsedJson);

  final String? title;
  final String? pubDate;
  final String? link;
  final String? guid;
  final String? author;
  final String? thumbnail;
  final String? description;
  // final String content;
  final List<dynamic>? categories;
}
