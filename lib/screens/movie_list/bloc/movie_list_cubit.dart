import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test/api_client.dart';
import 'package:movie_test/models/movie.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(MovieListLoading());
  Future<void> searchMovies(String input) async {
    //  TODO(brad) finish building function.
    emit(MovieListLoading());

    try {
      final List<Movie>? movies = await ApiClient().searchMovies(input);
      emit(
        MovieListSuccess(movies ?? <Movie>[]),
      );
    } catch (e) {
      emit(
        MovieListFailure(),
      );
    }
  }
}
