// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';


import 'package:movie_app/domain/entities/tv_video.dart';

abstract class TvVideoState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TvVideoInitialState extends TvVideoState {}

class TvVideoLoadingState extends TvVideoState {}

class TvVideoDataState extends TvVideoState {
final List<TvVideoEntity> result;
  TvVideoDataState({
    required this.result,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [result];
}

class TvVideoErorState extends TvVideoState {
  final String msg;

  TvVideoErorState(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
