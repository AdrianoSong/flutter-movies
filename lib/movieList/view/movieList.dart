import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/movieList/model/movie.dart';
import 'package:flutter_movies/movieList/view/movieDetails.dart';
import 'package:flutter_movies/movieList/view/movieListCellWidget.dart';
import 'package:flutter_movies/shared/api/movieApi.dart';
import 'dart:io' show Platform;

class MovieList extends StatefulWidget {
  MovieList({Key key}) : super(key: key);
  
  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  Future<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    movies = MovieApi.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Movie List",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Movie List")
        ),
        body: new Center(
          child: new FutureBuilder(future: movies, builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new MovieListWidget(movies: snapshot.data);
            } else if (snapshot.hasError) {
              return new MovieListEmptyStateWidget();
            } else {
              if (Platform.isIOS) {
                return new CupertinoActivityIndicator(radius: 28.0);
              } else {
                return new CircularProgressIndicator();
              }
            }
          }),
        ),
      ),
    );
  }
}

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;

  MovieListWidget({
    @required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return new GestureDetector(
          child: new Container(
            padding: new EdgeInsets.all(8.0),
            child: new MovieListCellWidget(movie: movies[index])
          ), 
          onTap: () {
            Navigator.push(
              context, new MaterialPageRoute(
                builder: (context) => MovieDetailsWidget(movie: movies[index])
              )
            );
          }
        );
      },
    );
  }
}

class MovieListEmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text("😥", style: new TextStyle(fontSize: 38.0)),
        new SizedBox(height: 16.0),
        new Text(
          "Opss... Occurs a problem, please try again later", 
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 20.0, color: Colors.red)
          )
        ]
      )
    );
  }
}
