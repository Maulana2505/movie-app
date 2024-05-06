import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_bloc.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_event.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_bloc.dart';
import 'package:movie_app/presentation/bloc/movietrending/movietrending_event.dart';
import 'package:movie_app/presentation/bloc/movievideo/movievideo_bloc.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_bloc.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_event.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_bloc.dart';

import 'package:movie_app/presentation/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                sl.get<AllTrendingBloc>()..add(AllTrendingLoadDataEvent()),
          ),
          BlocProvider(
            create: (context) =>
                sl.get<MovieTrendingBloc>()..add(MovieTrendingLoadDataEvent()),
          ),
          BlocProvider(
            create: (context) =>
                sl.get<TvTrendingBloc>()..add(TvTrendingLoadDataEvent()),
          ),
          BlocProvider(
            create: (context) => sl.get<TvVideoBloc>(),
          ),
          BlocProvider(
            create: (context) => sl.get<MovieVideoBloc>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        ));
  }
}
