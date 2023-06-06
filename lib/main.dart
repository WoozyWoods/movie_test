import 'package:flutter/material.dart';
import 'package:movie_test/api_client.dart';
import 'package:movie_test/screens/movie_screen.dart';
import 'models/movie.dart';
import 'package:movie_test/screens/movie_list/ui/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MovieList(),
    );
  }
}
