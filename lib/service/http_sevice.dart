import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_http_request/models/movie.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = "fdbffb917a35fcb2fc2a252eff95b85c";
  final String baseUrl = "https://api.themoviedb.org/3/";
  

  Future<List> getPopularMovies() async {
    final String uri = ('${baseUrl}movie/popular?api_key=${apiKey}');

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
  Future<List> getTopMovies() async {
    final String uri2 = ('${baseUrl}movie/top_rated?api_key=${apiKey}');

    http.Response result = await http.get(Uri.parse(uri2));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
