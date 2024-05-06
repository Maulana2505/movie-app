import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_bloc.dart';
import 'package:movie_app/presentation/bloc/alltrending/alltrending_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/presentation/pages/detail.dart';

class AlltrendingWidget extends StatefulWidget {
  const AlltrendingWidget({super.key});

  @override
  State<AlltrendingWidget> createState() => _AlltrendingWidgetState();
}

class _AlltrendingWidgetState extends State<AlltrendingWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTrendingBloc, AllTrendingState>(
      builder: (context, state) {
        if (state is AllTrendingLoadingState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.grey.withOpacity(0.4),
          );
        }
        if (state is AllTrendingErorState) {
          return Center(
            child: Text(state.msg),
          );
        }
        if (state is AllTrendingLoadDataState) {
          return Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.3],
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            child: PageView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                var data = state.result[index];
                return InkWell(
                  onTap: () async {
                    // final datas = sl.get<TvVideoBloc>().add(TvVideoLoadEvent(id: data.id));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMovie(
                            data: data,
                          ),
                        ));
                  },
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500/${data.posterPath}",
                        fit: BoxFit.fill,
                      )),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
