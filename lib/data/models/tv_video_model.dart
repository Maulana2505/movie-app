import 'dart:convert';

import 'package:movie_app/domain/entities/tv_video.dart';

class TvVideoModel extends TvVideoEntity {
  TvVideoModel(
      {required super.iso6391,
      required super.iso31661,
      required super.name,
      required super.key,
      required super.site,
      required super.size,
      required super.type,
      required super.official,
      required super.publishedAt,
      required super.id});
  factory TvVideoModel.fromJson(String str) =>
      TvVideoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TvVideoModel.fromMap(Map<String, dynamic> json) => TvVideoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}
