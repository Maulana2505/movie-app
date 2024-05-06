import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mocktail/mocktail.dart';
import 'package:movie_app/data/datasource/remote/movieApi.dart';

import '../../../helpers/dummy_data/json_reader.dart';

class MockHTTPClient extends Mock implements http.Client {}

void main() {
  late MovieDataSourceImpl movieApi;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    movieApi = MovieDataSourceImpl(client: mockHTTPClient);
  });

  group('Get All Trending', () {
    test('get succes data All Trending', () async {
      when(() => mockHTTPClient.get(
              Uri.parse(
                  'https://api.themoviedb.org/3/trending/3/trending/all/day?api_key=436a3a517c1afb89162acaf651635160'),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              })).thenAnswer(
        (_) async =>
            http.Response(fixture('dummy_movie_response.json'), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      await movieApi.getAllTrending();
      // assert
      verify(
        () => mockHTTPClient.get(
            Uri.parse(
                'https://api.themoviedb.org/3/trending/3/trending/all/day?api_key=436a3a517c1afb89162acaf651635160'),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
      );
    });

    test('get succes data Movie Trending', () async {
      when(() => mockHTTPClient.get(
              Uri.parse(
                  'https://api.themoviedb.org/3/trending/movie/day?api_key=436a3a517c1afb89162acaf651635160'),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              })).thenAnswer(
        (_) async =>
            http.Response(fixture('dummy_movie_response.json'), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      await movieApi.getMovieTrending();
      // assert
      verify(
        () => mockHTTPClient.get(
            Uri.parse(
                'https://api.themoviedb.org/3/trending/movie/day?api_key=436a3a517c1afb89162acaf651635160'),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
      );
    });

    test('get succes data TV Trending', () async {
      when(() => mockHTTPClient.get(
              Uri.parse(
                  'https://api.themoviedb.org/3/trending/tv/day?api_key=436a3a517c1afb89162acaf651635160'),
              headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              })).thenAnswer(
        (_) async =>
            http.Response(fixture('dummy_movie_response.json'), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }),
      );
      // act
      await movieApi.getTVTrending();
      // assert
      verify(
        () => mockHTTPClient.get(
            Uri.parse(
                'https://api.themoviedb.org/3/trending/tv/day?api_key=436a3a517c1afb89162acaf651635160'),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
      );
    });
  });
}
