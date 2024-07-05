import 'dart:convert';

import 'package:netflix/domain/models/movie.dart';
import 'package:netflix/widget/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'http://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _toprateded =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _recentreleasedUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  static const _popularSeriesUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happend');
    }
  }

  Future<List<Movie>> getTopratedMovies() async {
    final response = await http.get(Uri.parse(_toprateded));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something wrong');
    }
  }

  Future<List<Movie>> getrecentRelasedMovies() async {
    final response = await http.get(Uri.parse(_recentreleasedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something wrong');
    }
  }

  Future<List<Movie>> getpopularSeries() async {
    final responese = await http.get(Uri.parse(_popularSeriesUrl));
    if (responese.statusCode == 200) {
      final decodedData = json.decode(responese.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something wrong');
    }
  }
}
