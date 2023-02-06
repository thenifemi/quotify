// To parse this JSON data, do
//
//     final quotes = quotesFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'quotes.g.dart';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class Quotes extends HiveObject {
  Quotes({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  @HiveField(0)
  final int count;
  @HiveField(1)
  final int totalCount;
  @HiveField(2)
  final int page;
  @HiveField(3)
  final int totalPages;
  @HiveField(4)
  final int lastItemIndex;
  @HiveField(5)
  final List<Result> results;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        count: json["count"],
        totalCount: json["totalCount"],
        page: json["page"],
        totalPages: json["totalPages"],
        lastItemIndex: json["lastItemIndex"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "totalCount": totalCount,
        "page": page,
        "totalPages": totalPages,
        "lastItemIndex": lastItemIndex,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1)
class Result extends HiveObject {
  Result({
    required this.id,
    required this.author,
    required this.content,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
    this.faved,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String authorSlug;
  @HiveField(4)
  final int length;
  @HiveField(5)
  final DateTime dateAdded;
  @HiveField(6)
  final DateTime dateModified;
  @HiveField(7)
  bool? faved;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        author: json["author"],
        content: json["content"],
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "content": content,
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "dateModified":
            "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
      };
}
