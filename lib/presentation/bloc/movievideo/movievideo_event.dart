// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

abstract class MovieVideoEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieVideoLoadEvent extends MovieVideoEvent {
  final int id;
  MovieVideoLoadEvent({
    required this.id,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
