import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/data/datasource/remote/movieApi.dart';
import 'package:movie_app/data/models/trending_models.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';

class MockRemoteDataSource extends Mock implements MovieDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MovieRepositoryImpl repositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repositoryImpl = MovieRepositoryImpl(mockRemoteDataSource);
  });

  final result = [
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

  group("Get data", () {
    test("return data from remote data source repository Movie Tranding",
        () async {
      when(
        () => mockRemoteDataSource.getMovieTrending(),
      ).thenAnswer((_) async => result);
      final resultsData = await repositoryImpl.getMovieTrending();
      verify(
        () => mockRemoteDataSource.getMovieTrending(),
      );
      expect(resultsData, equals(Right(result)));
    });

    test("return data from remote data source repository All Tranding",
        () async {
      when(
        () => mockRemoteDataSource.getAllTrending(),
      ).thenAnswer((_) async => result);
      final resultsData = await repositoryImpl.getTrendingAll();
      verify(
        () => mockRemoteDataSource.getAllTrending(),
      );
      expect(resultsData, equals(Right(result)));
    });

    test("return data from remote data source repository TV Tranding",
        () async {
      when(
        () => mockRemoteDataSource.getTVTrending(),
      ).thenAnswer((_) async => result);
      final resultsData = await repositoryImpl.getTvTrending();
      verify(
        () => mockRemoteDataSource.getTVTrending(),
      );
      expect(resultsData, equals(Right(result)));
    });
  });
}
