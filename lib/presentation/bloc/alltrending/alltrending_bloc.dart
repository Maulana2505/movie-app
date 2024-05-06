import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecase/movie_usecase.dart';

import 'package:movie_app/presentation/bloc/alltrending/alltrending_event.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_state.dart';


class AllTrendingBloc extends Bloc<AllTrendingEvent, AllTrendingState> {
  final GetTrendingall getAllTrending;
  AllTrendingBloc(
    this.getAllTrending,
  ) : super(AllTrendingInitialState()) {
    on<AllTrendingLoadDataEvent>(_onLoadData);
  }

  void _onLoadData(AllTrendingLoadDataEvent event,
      Emitter<AllTrendingState> emitter) async {
    emitter(AllTrendingLoadingState());
    final loaddata = await getAllTrending.call();
    loaddata.fold((fail) => emitter(AllTrendingErorState(fail.massage)),
        (r) => emitter(AllTrendingLoadDataState(r)));
  }
}
