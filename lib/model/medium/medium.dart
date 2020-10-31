import 'package:json_annotation/json_annotation.dart';

import 'medium_feed.dart';

import 'medium_items.dart';

part 'medium.g.dart';

@JsonSerializable()

class MediumModel{

  MediumModel({
    this.status,
    this.feed,
    this.items
  });

  final String status;
  final MediumFeed feed;
  final List<MediumItems> items;

  // var itm = parsedJson['items'];
  //   var item = itm as List;
  //   List<MediumItems> itemDetails = item.map((e) => MediumItems.fromJson(e)).toList();

  factory MediumModel.fromJson(Map<String,dynamic> parsedJson) => _$MediumModelFromJson(parsedJson);
}