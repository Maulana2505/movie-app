// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movie_video.dart';
import 'package:movie_app/domain/entities/tv_video.dart';
import 'package:movie_app/domain/repository/movierepo.dart';

class GetTrendingall {
  final MovieRepository repository;
  GetTrendingall(
    this.repository,
  );
  Future<Either<Failure, List<ResultEntity>>> call() async {
    return await repository.getTrendingAll();
  }
}

class GetMovieTrending {
  final MovieRepository repository;
  GetMovieTrending(
    this.repository,
  );
  Future<Either<Failure, List<ResultEntity>>> call() async {
    return await repository.getMovieTrending();
  }
}

class GetTvTrending {
  final MovieRepository repository;
  GetTvTrending(
    this.repository,
  );
  Future<Either<Failure, List<ResultEntity>>> call() async {
    return await repository.getTvTrending();
  }
}

class GetMovieVideo {
  final MovieRepository repository;

  GetMovieVideo(this.repository);
  Future<Either<Failure, List<MovieVideoEntity>>> call(int id) async {
    return await repository.getMovieVideo(id);
  }
}

class GetTvVideo {
  final MovieRepository repository;

  GetTvVideo(this.repository);
  Future<Either<Failure, List<TvVideoEntity>>> call(int id) async {
    return await repository.getTvVideo(id);
  }
}
