import 'package:flutter/material.dart';

class MovieInfoCard extends StatelessWidget {
  MovieInfoCard({required this.movieDataText, this.textColors = Colors.white});
  String movieDataText;
  Color textColors;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 4,
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          movieDataText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColors,
          ),
        ),
      ),
    );
  }
}
