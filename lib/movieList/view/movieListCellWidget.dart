import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/movieList/model/movie.dart';

import 'package:flutter_movies/shared/customWidgets/cachedImage.dart';

class MovieListCellWidget extends StatelessWidget {
  final Movie movie;

  MovieListCellWidget({ @required this.movie });

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 220, 
      child: new Card(
        elevation: 6.0,
        margin: EdgeInsets.all(8.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 16.0), 
              child: new CustomCachedImage(imageURL: movie.coverURL, imageHeight: 200.0)
              ),
          //Flexible: for text wrap content
          new Flexible(
              child: 
              //Align for text aligment
              new Align(
                alignment: Alignment.centerLeft, 
                child:
                //Padding for text padding 
                new Padding(
                  padding: const EdgeInsets.only(left: 16.0), 
                  child: 
                  new Text( 
                    movie.title, 
                    style: 
                    //TextStyle for textStyle
                    new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0)
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}