import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/movie_video.dart';
import 'package:movie_app/domain/usecase/movie_usecase.dart';

import 'package:movie_app/presentation/bloc/MovieVideo/MovieVideo_event.dart';
import 'package:movie_app/presentation/bloc/movievideo/movievideo_state.dart';

class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState> {
  final GetMovieVideo getMovieVideo;
  final List<MovieVideoEntity> movievideo = [];

  MovieVideoBloc(
    this.getMovieVideo,
  ) : super(MovieVideoInitialState()) {
    on<MovieVideoLoadEvent>(_onLoadData);
  }

  void _onLoadData(
      MovieVideoLoadEvent event, Emitter<MovieVideoState> emitter) async {
    emitter(MovieVideoLoadingState());
    final loaddata = await getMovieVideo.call(event.id);
    loaddata.fold((fail) => emitter(MovieVideoErorState(fail.massage)),
        (r) {
          movievideo.addAll(r.where((element) => element.type == "Trailer" || element.type == "trailer"));
          emitter(MovieVideoDataState(result: r));
        });
  }
}
