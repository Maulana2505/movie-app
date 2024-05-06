import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/trending_models.dart';
import 'package:movie_app/domain/entities/movie.dart';

void main() {
  final resultModel = [
    Results(
      adult: false,
      backdropPath: "/5zmiBoMzeeVdQ62no55JOJMY498.jpg",
      id: 126308,
      title: '',
      originalLanguage: '',
      originalTitle: '',
      overview: '',
      posterPath: '',
      popularity: 270.169,
      releaseDate: DateTime.now(),
      video: false,
      voteAverage: 8.717,
      voteCount: 23,
      name: "Shōgun",
      originalName: "Shōgun",
      mediaType: ''

    )
  ];
  final trendingModels = TrendingModel(
      page: 1, results: resultModel, totalPages: 1000, totalResults: 20000);

  
  test("Data Models", () async {
    expect(trendingModels, isA<TrendingEntity>());
  });
}
