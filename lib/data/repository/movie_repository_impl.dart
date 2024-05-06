// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_app/data/datasource/remote/movieApi.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_video.dart';
import 'package:movie_app/domain/entities/tv_video.dart';
import 'package:movie_app/domain/repository/movierepo.dart';

import '../../core/error/failure.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl(
    this.movieDataSource,
  );

  @override
  Future<Either<Failure, List<ResultEntity>>> getMovieTrending() async {
    try {
      final data = await movieDataSource.getMovieTrending();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(massage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ResultEntity>>> getTrendingAll() async {
    try {
      final data = await movieDataSource.getAllTrending();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(massage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ResultEntity>>> getTvTrending() async {
    try {
      final data = await movieDataSource.getTVTrending();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(massage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieVideoEntity>>> getMovieVideo(int id) async{
   try {
      final data = await movieDataSource.getMovieVideo(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(massage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvVideoEntity>>> getTvVideo(int id) async{
    try {
      final data = await movieDataSource.getTvVideo(id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(massage: e.toString()));
    }
  }
}
