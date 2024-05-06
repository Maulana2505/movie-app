

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/datasource/remote/movieApi.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/domain/repository/movierepo.dart';
import 'package:movie_app/domain/usecase/movie_usecase.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_bloc.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_bloc.dart';
import 'package:movie_app/presentation/bloc/movievideo/movievideo_bloc.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_bloc.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_bloc.dart';

final sl = GetIt.instance;

void init(){
  // External
  sl.registerLazySingleton(() => http.Client(),);
  sl.registerLazySingleton(() => TvVideoBloc(sl()).tvvideo);

  // Bloc
  sl.registerFactory(() => AllTrendingBloc(sl()));
  sl.registerFactory(() => MovieTrendingBloc(sl()));
  sl.registerFactory(() => TvTrendingBloc(sl()));
  sl.registerFactory(() => TvVideoBloc(sl()));
  sl.registerFactory(() => MovieVideoBloc(sl()));
  // Use Case 
  sl.registerLazySingleton(() => GetTrendingall(sl()));
  sl.registerLazySingleton(() => GetMovieTrending(sl()));
  sl.registerLazySingleton(() => GetTvTrending(sl()));
  sl.registerLazySingleton(() => GetTvVideo(sl()));
  sl.registerLazySingleton(() => GetMovieVideo(sl()));

  // repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  // Data Source
  sl.registerLazySingleton<MovieDataSource>(() => MovieDataSourceImpl(client: sl()));

}