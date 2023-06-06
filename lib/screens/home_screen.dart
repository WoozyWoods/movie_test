import 'package:flutter/material.dart';
import 'package:movie_test/api_client.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/screens/movie_screen.dart';
import 'package:movie_test/assets/constants.dart';
import 'package:movie_test/api_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter(BuildContext context) async {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadiusValue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: borderRadiusValue,
                child: Image(
                  fit: BoxFit.fill,
                  height: 400.0,
                  image: NetworkImage(movie.poster ?? ''),
                ),
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
