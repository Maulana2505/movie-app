// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

abstract class TvVideoEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TvVideoLoadEvent extends TvVideoEvent {
  final int id;
  TvVideoLoadEvent({
    required this.id,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
