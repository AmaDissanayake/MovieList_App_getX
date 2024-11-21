import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_list_app/models/movie.dart';
import 'package:movie_list_app/constants.dart';

class Api {
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/trending/movie/day?api_key=${Constants.apiKey}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/top_rated?api_key=${Constants.apiKey}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top-rated movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/upcoming?api_key=${Constants.apiKey}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}
