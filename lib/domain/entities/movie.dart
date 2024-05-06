class TrendingEntity {
  final int page;
  final List<ResultEntity> results;
  final int totalPages;
  final int totalResults;

  TrendingEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class ResultEntity{
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
  

  ResultEntity({
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
  });

 

}
