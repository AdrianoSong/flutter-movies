import 'package:flutter_movies/movieList/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MovieApi {
  
  static Future<List<Movie>> fetchMovies() async {
    
    final response = await http.get("https://sky-exercise.herokuapp.com/api/Movies");
    
    if (response.statusCode == 200) {
      var moviesDecoded = json.decode(response.body);
      var movies = new List<Movie>();
      
      moviesDecoded.forEach((value) => movies.add(Movie.fromJson(value)));

      return movies;
      
    } else {
      throw Exception("Fail to load movies $response.statusCode");
    }
  }
}