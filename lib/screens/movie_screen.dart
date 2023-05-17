import 'package:flutter/material.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/models/movie.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(movie.title ?? ''),
      ),
    );
  }
}
