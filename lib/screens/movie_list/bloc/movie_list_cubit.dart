import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test/models/movie.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(MovieListLoading());
  Future<void> searchMovies(String searchTerm) async {
    //  TODO(brad) finish building function.
  }
}
