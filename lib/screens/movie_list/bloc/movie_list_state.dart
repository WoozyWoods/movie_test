part of 'movie_list_cubit.dart';

@immutable
abstract class MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListSuccess extends MovieListState {
  MovieListSuccess(this.movies);
  final List<Movie> movies;
}

class MovieListFailure extends MovieListState {}
