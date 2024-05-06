import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieTrendingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieTrendingInitialState extends MovieTrendingState {}

class MovieTrendingLoadingState extends MovieTrendingState {}

class MovieTrendingLoadDataState extends MovieTrendingState {
  final List<ResultEntity> result;

  MovieTrendingLoadDataState(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class MovieTrendingErorState extends MovieTrendingState {
  final String msg;

  MovieTrendingErorState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
