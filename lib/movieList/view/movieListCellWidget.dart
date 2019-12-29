import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_movies/movieList/model/movie.dart';
import 'dart:io' show Platform;

class MovieListCellWidget extends StatelessWidget {
  final Movie movie;

  MovieListCellWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new CachedNetworkImage(
              imageUrl: movie.coverURL,
              height: 200.0,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => 
                Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error)),
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
      );
  }
}
