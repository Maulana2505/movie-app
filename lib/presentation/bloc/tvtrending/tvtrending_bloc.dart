import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecase/movie_usecase.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_event.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_state.dart';

class TvTrendingBloc extends Bloc<TvTrendingEvent, TvTrendingState> {
  final GetTvTrending getTvTrending;
  TvTrendingBloc(
    this.getTvTrending,
  ) : super(TvTrendingInitialState()) {
    on<TvTrendingLoadDataEvent>(_onLoadData);
  }

  void _onLoadData(
      TvTrendingLoadDataEvent event, Emitter<TvTrendingState> emitter) async {
    emitter(TvTrendingLoadingState());
    final loaddata = await getTvTrending.call();
    loaddata.fold((fail) => emitter(TvTrendingErorState(fail.massage)),
        (r) => emitter(TvTrendingLoadDataState(r)));
  }
}
