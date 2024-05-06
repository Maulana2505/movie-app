import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecase/movie_usecase.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_event.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_state.dart';

class MovieTrendingBloc extends Bloc<MovieTrendingEvent, MovieTrendingState> {
  final GetMovieTrending getMovieTrending;
  MovieTrendingBloc(
    this.getMovieTrending,
  ) : super(MovieTrendingInitialState()) {
    on<MovieTrendingLoadDataEvent>(_onLoadData);
  }

  void _onLoadData(MovieTrendingLoadDataEvent event,
      Emitter<MovieTrendingState> emitter) async {
    emitter(MovieTrendingLoadingState());
    final loaddata = await getMovieTrending.call();
    loaddata.fold((fail) => emitter(MovieTrendingErorState(fail.massage)),
        (r) => emitter(MovieTrendingLoadDataState(r)));
  }
}
