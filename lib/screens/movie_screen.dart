import 'package:flutter/material.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/assets/movieinfo_card.dart';
import 'package:movie_test/assets/constants.dart';

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
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
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
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: IconButton(
                              splashRadius: 25,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadiusValue,
                    ),
                    color: Colors.white12,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 8.0, top: 8.0),
                      child: Text(
                        movie.title ?? '',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            movie.imdbRating ?? '',
                            style: TextStyle(
                                color: movie.imdbRating != 7.0
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.thumb_up_alt,
                            color: movie.imdbRating != 7.0
                                ? Colors.green
                                : Colors.red,
                          ),
                        ],
                      ),
                      // MovieInfoCard(
                      //   movieDataText: movie.imdbRating ?? '',
                      //   textColors: Colors.green,
                      // ),
                      SizedBox(
                        width: sizedBoxWidth,
                      ),
                      MovieInfoCard(
                        movieDataText: movie.rated ?? '',
                      ),
                      SizedBox(
                        width: sizedBoxWidth,
                      ),
                      MovieInfoCard(movieDataText: movie.genre ?? ''),
                    ],
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusValue,
                    ),
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      movie.plot ?? '',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
