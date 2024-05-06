import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_bloc.dart';
import 'package:movie_app/presentation/bloc/tvtrending/tvtrending_state.dart';
import 'package:movie_app/presentation/pages/detail.dart';

class TvTrendingWidget extends StatelessWidget {
  const TvTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<TvTrendingBloc, TvTrendingState>(
        builder: (context, state) {
          if (state is TvTrendingLoadingState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.grey.withOpacity(0.2),
                    // child: ,
                  ),
                );
              },
            );
          }
          if (state is TvTrendingErorState) {
            return Center(
              child: Text(
                state.msg,
                style: TextStyle(color: Colors.white60),
              ),
            );
          }
          if (state is TvTrendingLoadDataState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  var data = state.result[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMovie(
                            data: data,
                          ),
                        ));
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Image.network(
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width / 2.8,
                                fit: BoxFit.fill,
                                "https://image.tmdb.org/t/p/w92/${data.posterPath}"),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              data.name,
                              textAlign: TextAlign.center,
                              softWrap: false,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(color: Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
