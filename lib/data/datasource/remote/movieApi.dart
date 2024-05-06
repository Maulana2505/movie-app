// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/data/models/movie_video_model.dart';
import 'package:movie_app/data/models/trending_models.dart';
import 'package:movie_app/data/models/tv_video_model.dart';

abstract class MovieDataSource {
  Future<List<Results>> getAllTrending();
  Future<List<Results>> getMovieTrending();
  Future<List<Results>> getTVTrending();
  Future<List<MovieVideoModel>> getMovieVideo(int id);
  Future<List<TvVideoModel>> getTvVideo(int id);
}

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;
  MovieDataSourceImpl({
    required this.client,
  });
  var apiurl = Constant.apiURL;
  var apitoken = Constant.apitoken;

  @override
  Future<List<Results>> getAllTrending() async {
    final response = await client.get(
        Uri.parse(
            'https://api.themoviedb.org/3/trending/all/week?api_key=436a3a517c1afb89162acaf651635160'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });

    if (response.statusCode == 200) {
      var data = (json.decode(response.body)['results'] as List)
          .map((e) => Results.fromMap(e))
          .toList();
      return data;
      // return TrendingModel.fromMap(jsonDecode(response.body)['results']);
    } else {
      print(jsonDecode(response.body));
      throw Exception(response.body);
    }
  }

  @override
  Future<List<Results>> getMovieTrending() async {
    final response = await client.get(
        Uri.parse(
            'https://api.themoviedb.org/3/trending/movie/day?api_key=436a3a517c1afb89162acaf651635160'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });

    if (response.statusCode == 200) {
      var data = (json.decode(response.body)['results'] as List)
          .map((e) => Results.fromMap(e))
          .toList();
      return data;
      // return TrendingModel.fromMap(jsonDecode(response.body)['results']);
    } else {
      print(jsonDecode(response.body));
      throw Exception(response.body);
    }
  }

  @override
  Future<List<Results>> getTVTrending() async {
    final response = await client.get(
        Uri.parse(
            'https://api.themoviedb.org/3/trending/tv/day?api_key=436a3a517c1afb89162acaf651635160'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });

    if (response.statusCode == 200) {
      var data = (json.decode(response.body)['results'] as List)
          .map((e) => Results.fromMap(e))
          .toList();
      return data;
      // return TrendingModel.fromMap(jsonDecode(response.body)['results']);
    } else {
      print(jsonDecode(response.body));
      throw Exception(response.body);
    }
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideo(int id) async {
    final response = await client.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$id/videos?api_key=436a3a517c1afb89162acaf651635160'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });

    if (response.statusCode == 200) {
      var data = (json.decode(response.body)['results'] as List)
          .map((e) => MovieVideoModel.fromMap(e))
          .toList();
          print(jsonEncode(data));
      return data;
      // return TrendingModel.fromMap(jsonDecode(response.body)['results']);
    } else {
      print(jsonDecode(response.body));
      throw Exception(response.body);
    }
  }

  @override
  Future<List<TvVideoModel>> getTvVideo(int id) async {
    final response = await client.get(
        Uri.parse(
            'https://api.themoviedb.org/3/tv/$id/videos?api_key=436a3a517c1afb89162acaf651635160'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });

    if (response.statusCode == 200) {
      var data = (json.decode(response.body)['results'] as List)
          .map((e) => TvVideoModel.fromMap(e))
          .toList();
          // print(jsonEncode(data).toString());
      return data;
      
      // return TrendingModel.fromMap(jsonDecode(response.body)['results']);
    } else {
      print("jsonDecode(response.body)");
      throw Exception(response.body);
    }
  }
}
