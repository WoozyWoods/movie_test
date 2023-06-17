import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test/api_client.dart';
import 'package:movie_test/screens/movie_list/bloc/movie_list_cubit.dart';
import 'package:movie_test/screens/movie_screen.dart';
import '../../../models/movie.dart';
import 'package:movie_test/assets/constants.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Search Movies'),
        ),
        backgroundColor: Colors.black12,
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
        Container(
          color: Colors.white10,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
            ),
            controller: controller,
            onEditingComplete: () async {
              await context
                  .read<MovieListCubit>()
                  .searchMovies(controller.value.text);
            },
          ),
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 150,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final Movie movie = state.movies[index];
        return Align(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                _goToDetailScreen(context, movie.imdbID ?? '');
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: borderRadiusValue,
                    child: Image(
                      fit: BoxFit.fill,
                      height: 280.0,
                      image: NetworkImage(movie.poster ?? ''),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        movie.title ?? '',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  Text(
                    movie.year ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: state.movies.length,
    );
  }
}
