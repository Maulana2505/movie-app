import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/domain/entities/movie.dart';

import 'package:movie_app/injection.dart';
import 'package:movie_app/presentation/bloc/MovieVideo/MovieVideo_event.dart';
import 'package:movie_app/presentation/bloc/movievideo/movievideo_bloc.dart';
import 'package:movie_app/presentation/bloc/movievideo/movievideo_state.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_bloc.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_event.dart';
import 'package:movie_app/presentation/bloc/tvvideo/movievideo_state.dart';
import 'package:movie_app/presentation/widgets/youtube_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovie extends StatefulWidget {
  final ResultEntity data;
  const DetailMovie({super.key, required this.data});

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  void initState() {
    super.initState();
    print(widget.data.id);
    BlocProvider.of<MovieVideoBloc>(context)
        .add(MovieVideoLoadEvent(id: widget.data.id));
    BlocProvider.of<TvVideoBloc>(context)
        .add(TvVideoLoadEvent(id: widget.data.id));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.data;
    sl.get<TvVideoBloc>().tvvideo.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Opacity(
                  opacity: 0.8,
                  child: CachedNetworkImage(
                    imageUrl:
                        "http://image.tmdb.org/t/p/original/${widget.data.backdropPath}",
                    fit: BoxFit.fill,
                  ),
                )),
            SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  )),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.data.mediaType == "tv"
                    ? Text(
                        widget.data.name,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(widget.data.title,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.004,
                      ),
                      Text(widget.data.voteAverage.toString(),
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.004,
                      ),
                      Text("(${widget.data.popularity.toString()})",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Text(
                  "Overview",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.data.overview,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Videos",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                widget.data.mediaType == "tv"
                    ? BlocBuilder<TvVideoBloc, TvVideoState>(
                        builder: (context, state) {
                          if (state is TvVideoLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is TvVideoErorState) {
                            return Text(
                              state.msg,
                              style: const TextStyle(color: Colors.white),
                            );
                          }
                          if (state is TvVideoDataState) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.result.length,
                                itemBuilder: (context, index) {
                                  var data = state.result[index];

                                  return data.type == "trailer" ||
                                          data.type == "Trailer" ||
                                          data.type == "clip" ||
                                          data.official == true
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        YoutubeWidget(
                                                            ytkey: data.key)));
                                          },
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: Opacity(
                                                          opacity: 0.8,
                                                          child: Image.network(
                                                              YoutubePlayer
                                                                  .getThumbnail(
                                                                      videoId: data
                                                                          .key)))),
                                                ],
                                              )),
                                        )
                                      : Container();
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      )
                    : BlocBuilder<MovieVideoBloc, MovieVideoState>(
                        builder: (context, state) {
                          if (state is MovieVideoLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          if (state is MovieVideoErorState) {
                            // print(sta)
                            return Text(
                              state.msg,
                              style: const TextStyle(color: Colors.white),
                            );
                          }
                          if (state is MovieVideoDataState) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.result.length,
                                itemBuilder: (context, index) {
                                  var data = state.result[index];
                                  return data.type == "trailer" ||
                                          data.type == "Trailer" ||
                                          data.type == "clip" ||
                                          data.official == true
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                   Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        YoutubeWidget(
                                                            ytkey: data.key)));
                                                },
                                                child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(10)),
                                                    child: Opacity(
                                                        opacity: 0.8,
                                                        child: Image.network(
                                                            YoutubePlayer
                                                                .getThumbnail(
                                                                    videoId: data
                                                                        .key)))),
                                              ),
                                            ],
                                          ))
                                      : Container();
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
