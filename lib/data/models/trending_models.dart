import 'dart:convert';

import 'package:movie_app/domain/entities/movie.dart';

class TrendingModel extends TrendingEntity {
  final int page;
  final List<ResultEntity> results;
  final int totalPages;
  final int totalResults;
  TrendingModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  }) : super(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults);

  factory TrendingModel.fromMap(Map<String, dynamic> json) => TrendingModel(
        page: json["page"],
        results: List<Results>.from(json["results"].map((x) => x)),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x)),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
  factory TrendingModel.fromJson(String str) =>
      TrendingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}

class Results extends ResultEntity {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final double popularity;
  final DateTime releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String name;
  final String originalName;
  final String mediaType;
  Results({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.mediaType
  }) : super(
            adult: adult,
            backdropPath: backdropPath,
            id: id,
            title: title,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            posterPath: posterPath,
            popularity: popularity,
            releaseDate: releaseDate,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount,
            name: name,
            originalName: originalName,
            mediaType: mediaType);

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"] ?? "",
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"] ?? "",
        overview: json["overview"],
        posterPath: json["poster_path"],
        popularity: json["popularity"]?.toDouble(),
        releaseDate:
            DateTime.parse(json["release_date"] ?? DateTime.now().toString()),
        video: json["video"] ?? false,
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        name: json["name"] ?? "",
        originalName: json["original_name"] ?? "",
        mediaType: json["media_type"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "popularity": popularity,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
        "media_type": mediaType,
      };
  factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}
