
import 'package:flutter/material.dart';
import 'package:flutter_movies/movieList/model/movie.dart';
import 'package:flutter_movies/shared/customWidgets/cachedImage.dart';

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
    body: new SingleChildScrollView(
      child: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new CustomCachedImage(imageURL: movie.coverURL, imageHeight: 400.0),
            SizedBox(height: 16),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: <Widget>[
                new Align(
                  alignment: Alignment.centerLeft, 
                  child: new Row(children: <Widget>[
                    new Text(
                      "Lançamento: ", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0)
                      ),
                    new Text(
                      "${movie.releaseYear}", 
                      style: new TextStyle(
                      fontSize: 18.0)
                      )
                    ]
                )
              ),
                new Align(
                  alignment: Alignment.centerRight, 
                  child: new Row(children: <Widget>[
                    new Text(
                      "Duração: ", 
                      style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0)
                      ),
                    new Text(
                      "${movie.duration}", 
                      style: new TextStyle(
                        fontSize: 18.0)
                      )
                    ]
                  )
                )
            ]
          ),
            SizedBox(height: 16),
            new Align(
              alignment: Alignment.centerLeft, 
              child: new Text(
                "Sinopse", 
                style: new TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18.0
                )
              )
            ),
            SizedBox(height: 8),
            new Text(
              movie.overview, 
              style: new TextStyle(fontSize: 18.0)
              )
            ],
          )
        )
      )
    );
  }
}