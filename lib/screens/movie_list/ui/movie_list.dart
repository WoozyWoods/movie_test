import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test/api_client.dart';
import 'package:movie_test/screens/movie_list/bloc/movie_list_cubit.dart';
import 'package:movie_test/screens/movie_screen.dart';
import '../../../models/movie.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: SafeArea(
        child: BlocProvider<MovieListCubit>(
          create: (BuildContext context) => MovieListCubit(),
          child: _MovieList(),
        ),
      ),
    );
  }
}

class _MovieList extends StatelessWidget {
  _MovieList({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  void _goToDetailScreen(BuildContext context, String id) async {
    final Movie? movie = await ApiClient().findById(id);

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
    return Column(
      children: [
        TextField(
          controller: controller,
          onEditingComplete: () async {
            await context
                .read<MovieListCubit>()
                .searchMovies(controller.value.text);
          },
        ),
        Expanded(
          child: BlocBuilder<MovieListCubit, MovieListState>(
            builder: (BuildContext context, MovieListState state) {
              if (state is MovieListLoading) {
                return _loading();
              }
              if (state is MovieListSuccess) {
                return _success(state);
              }

              return _failure();
            },
          ),
        ),
      ],
    );
  }

  Widget _failure() {
    return const Center(
      child: Icon(Icons.error),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _success(MovieListSuccess state) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final Movie movie = state.movies[index];
        return Text(movie.title ?? '');
      },
      itemCount: state.movies.length,
    );
  }
}
