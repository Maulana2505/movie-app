import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repository/movierepo.dart';
import 'package:movie_app/domain/usecase/movie_usecase.dart';


class MockGetTrendingAllRepository extends Mock implements MovieRepository {}

void main() {
   late GetTrendingall usecase;
   late MockGetTrendingAllRepository mockGetTrendingAllRepository;

  setUp(() {
    mockGetTrendingAllRepository = MockGetTrendingAllRepository();
    usecase = GetTrendingall(mockGetTrendingAllRepository);
  });

  final result = [
    ResultEntity(
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
  // final trending =[
  //   TrendingEntity(page: 1, results: result, totalPages: 1000, totalResults: 20000)
  // ];

  test('Should Get All Trending', () async {
  when(()=>mockGetTrendingAllRepository.getTrendingAll())
        .thenAnswer((_) async => Right(result));
    final dataResult = await usecase.call();
    expect(dataResult, Right(result));
    verify(() =>mockGetTrendingAllRepository.getTrendingAll());
    verifyNoMoreInteractions(mockGetTrendingAllRepository);
  });
}
