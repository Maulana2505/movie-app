import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/domain/entities/movie.dart';


import 'package:movie_app/domain/usecase/movie_usecase.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_bloc.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_event.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_state.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_bloc.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_event.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_state.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_bloc.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_event.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_state.dart';

class MockMovieTrending extends Mock implements GetMovieTrending {}

class MockAllTrending extends Mock implements GetTrendingall {}

class MockTvTrending extends Mock implements GetTvTrending {}

void main() {
  // Mock
  late MockMovieTrending mockMovieTrending;
  late MockAllTrending mockAllTrending;
  late MockTvTrending mockTvTrending;

  // Bloc
  late MovieTrendingBloc movieTrendingBloc;
  late AllTrendingBloc allTrendingBloc;
  late TvTrendingBloc tvTrendingBloc;

  setUp(() {
    //Mock
    mockMovieTrending = MockMovieTrending();
    mockAllTrending = MockAllTrending();
    mockTvTrending = MockTvTrending();

    // Bloc
    movieTrendingBloc = MovieTrendingBloc(mockMovieTrending);
    allTrendingBloc = AllTrendingBloc(mockAllTrending);
    tvTrendingBloc = TvTrendingBloc(mockTvTrending);
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
  group("Succes Bloc", () {
    // Movie Trending Bloc test
    blocTest<MovieTrendingBloc, MovieTrendingState>(
      "emit MovieTrendingLoading,MovieTrendingLoadData",
      build: () {
        when(() => mockMovieTrending.call())
            .thenAnswer((_) async => Right(result));
        return movieTrendingBloc;
      },
      act: (bloc) => bloc.add(MovieTrendingLoadDataEvent()),
      expect: () =>
          [MovieTrendingLoadingState(), MovieTrendingLoadDataState(result)],
    );

    // All Trending Bloc test
    blocTest<AllTrendingBloc, AllTrendingState>(
      "emit AllTrendingLoading,AllTrendingLoadData",
      build: () {
        when(() => mockAllTrending.call())
            .thenAnswer((_) async => Right(result));
        return allTrendingBloc;
      },
      act: (bloc) => bloc.add(AllTrendingLoadDataEvent()),
      expect: () =>
          [AllTrendingLoadingState(), AllTrendingLoadDataState(result)],
    );

    // TV Trending Bloc test
    blocTest<TvTrendingBloc, TvTrendingState>(
      "emit TvTrendingLoading,TvTrendingLoadData",
      build: () {
        when(() => mockTvTrending.call())
            .thenAnswer((_) async => Right(result));
        return tvTrendingBloc;
      },
      act: (bloc) => bloc.add(TvTrendingLoadDataEvent()),
      expect: () => [TvTrendingLoadingState(), TvTrendingLoadDataState(result)],
    );
  });
}
