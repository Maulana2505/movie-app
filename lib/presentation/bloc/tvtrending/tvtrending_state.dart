import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie.dart';

abstract class TvTrendingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TvTrendingInitialState extends TvTrendingState {}

class TvTrendingLoadingState extends TvTrendingState {}

class TvTrendingLoadDataState extends TvTrendingState {
  final List<ResultEntity> result;

  TvTrendingLoadDataState(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class TvTrendingErorState extends TvTrendingState {
  final String msg;

  TvTrendingErorState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
