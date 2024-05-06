
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/tv_video.dart';

import 'package:movie_app/domain/usecase/movie_usecase.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_event.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_state.dart';

class TvVideoBloc extends Bloc<TvVideoEvent, TvVideoState> {
  final GetTvVideo getTvVideo;
  final List<TvVideoEntity> tvvideo = [];
  TvVideoBloc(
    this.getTvVideo,
  ) : super(TvVideoInitialState()) {
    on<TvVideoLoadEvent>(_onLoadData);
  }

  void _onLoadData(
      TvVideoLoadEvent event, Emitter<TvVideoState> emitter) async {
    emitter(TvVideoLoadingState());
    final loaddata = await getTvVideo.call(event.id);
    loaddata.fold((fail) => emitter(TvVideoErorState(fail.massage)), (r) {
      tvvideo.addAll(r.where((element) => element.type == "Trailer" || element.type == "trailer"));
      // print( "ini ${tvvideo.first.key}");
      
      emitter(TvVideoDataState(result: r));
      print(json.encode(r));
    });
  }
}
