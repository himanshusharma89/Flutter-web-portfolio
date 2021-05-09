import 'package:json_annotation/json_annotation.dart';

part 'medium_feed.g.dart';

@JsonSerializable()
class MediumFeed {
  MediumFeed(
      {this.url,
      this.title,
      this.link,
      this.author,
      this.description,
      this.image});

  factory MediumFeed.fromJson(Map<String, dynamic> parsedJson) =>
      _$MediumFeedFromJson(parsedJson);

  final String? url;
  final String? title;
  final String? link;
  final String? author;
  final String? description;
  final String? image;
}
