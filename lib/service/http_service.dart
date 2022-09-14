import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:flutter_request_api/models/movie.dart';

class HttpService {
  final String apiKey = '4d47df445493fd8d52cbc60138c28ce7';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == HttpStatus.ok) {
      print('Sukses');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}