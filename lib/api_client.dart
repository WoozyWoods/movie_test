import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_test/models/movie.dart';

class ApiClient {
  const ApiClient._();
  static const ApiClient _instance = ApiClient._();
  factory ApiClient() => _instance;

  final String baseUrl = 'https://www.omdbapi.com/?apikey=48d812d0&';

  Future<void> findById(String id) async {
    final http.Response response = await http.get(
      Uri.parse('${baseUrl}i=$id'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final Movie movie = Movie.fromJson(json);
      print(json);
    }
  }
}
