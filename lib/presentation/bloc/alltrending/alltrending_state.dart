import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie.dart';

abstract class AllTrendingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AllTrendingInitialState extends AllTrendingState {}

class AllTrendingLoadingState extends AllTrendingState {}

class AllTrendingLoadDataState extends AllTrendingState {
  final List<ResultEntity> result;

  AllTrendingLoadDataState(this.result);
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class AllTrendingErorState extends AllTrendingState {
  final String msg;

  AllTrendingErorState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
