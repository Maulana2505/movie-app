// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movie_app/domain/entities/movie_video.dart';

abstract class MovieVideoState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieVideoInitialState extends MovieVideoState {}

class MovieVideoLoadingState extends MovieVideoState {}

class MovieVideoDataState extends MovieVideoState {
final List<MovieVideoEntity> result;
  MovieVideoDataState({
    required this.result,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieVideoErorState extends MovieVideoState {
  final String msg;

  MovieVideoErorState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
