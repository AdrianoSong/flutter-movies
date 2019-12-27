import 'package:flutter/material.dart';
import 'package:flutter_movies/movieList/model/movie.dart';
import 'package:flutter_movies/shared/api/movieApi.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        body: Center(
          child: new FutureBuilder(future: movies, builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new MovieListWidget(movies: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("Fail to load movies ${snapshot.error}");
            } else {
              return new CircularProgressIndicator();
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
    this.movies
  });

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new CachedNetworkImage(
                imageUrl: movies[index].coverURL,
                height: 200.0,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error)),
              new Text(movies[index].title,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)
              ),
              new Divider()
            ],
          ),
        );
      },
    );
  }
}
