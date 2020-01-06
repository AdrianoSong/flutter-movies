
import 'package:flutter/material.dart';
import 'package:flutter_movies/movieList/model/movie.dart';

class MovieDetailsWidget extends StatelessWidget {

  final Movie movie;

  MovieDetailsWidget({
    @required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(movie.title)
      ),
    body: new Text("TODO: complete this screen")
    );
  }
}