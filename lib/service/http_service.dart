import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_request_api/models/movie.dart';

class HttpService {
  final String apiKey = '<3ec9abeb422261e248a0830a0f191849>';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("Sukses");
      }
      final response = json.decode(result.body);
      final moviesMap = response['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
      // ignore: dead_code
      return response;
    } else {
      if (kDebugMode) {
        print("Gagal");
      }
      return null;
    }
  }
}
