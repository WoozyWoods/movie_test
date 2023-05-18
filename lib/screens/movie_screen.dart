import 'package:flutter/material.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/models/movie.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 4),
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    fit: BoxFit.fill,
                    height: 440.0,
                    image: NetworkImage(movie.poster ?? ''),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                movie.title ?? '',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.year ?? '',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    movie.rated ?? '',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    movie.genre ?? '',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  movie.plot ?? '',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
