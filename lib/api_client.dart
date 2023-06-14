import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_test/models/movie.dart';

class ApiClient {
  const ApiClient._();
  static const ApiClient _instance = ApiClient._();
  factory ApiClient() => _instance;

  final String baseUrl = 'https://www.omdbapi.com/?apikey=48d812d0&';

  Future<Movie?> findById(String id) async {
    final http.Response response = await http.get(
      Uri.parse('${baseUrl}i=$id'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Movie.fromJson(json);
    }
    return null;
  }

  Future<List<Movie>?> searchMovies(
    String input, [
    int? pageNumber,
  ]) async {
    final String pageString = pageNumber != null ? '&page=$pageNumber' : '';

    final http.Response response = await http.get(
      Uri.parse('${baseUrl}s=$input$pageString'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<Map<String, dynamic>> listFromJson =
          List<Map<String, dynamic>>.from(json['Search']);
      final List<Movie> movies = List<Movie>.from(
        listFromJson.map<Movie?>(
          (Map<String, dynamic> json) => Movie.fromJson(json),
        ),
      );
      return movies;
    }

    return null;
  }
}
