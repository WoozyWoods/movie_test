import 'package:flutter/material.dart';
import 'package:movie_test/api_client.dart';
import 'package:movie_test/screens/movie_screen.dart';

import '../../../models/movie.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  void _goToDetailScreen(BuildContext context) async {
    final Movie? movie = await ApiClient().findById('tt0190332');

    if (movie != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MovieScreen(movie),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
