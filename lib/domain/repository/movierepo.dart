import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_video.dart';
import 'package:movie_app/domain/entities/tv_video.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<ResultEntity>>> getTrendingAll();
  Future<Either<Failure, List<ResultEntity>>> getMovieTrending();
  Future<Either<Failure, List<ResultEntity>>> getTvTrending();
  Future<Either<Failure, List<MovieVideoEntity>>> getMovieVideo(int id);
  Future<Either<Failure, List<TvVideoEntity>>> getTvVideo(int id);
}
