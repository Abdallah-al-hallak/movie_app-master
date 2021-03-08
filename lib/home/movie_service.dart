import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/environment_config.dart';
import 'package:movieapp/home/movies_exception.dart';

import 'movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this._environmentConfig, this._dio);

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  Future<List<Movie>> getMovies() async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/search/movie?api_key=1b7379446c64c65ef9206621be4e08e3&language=en-US&query=REEL&page=1",
      );

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      List<Movie> movies = results
          .map((movieData) => Movie.fromMap(movieData))
          .toList(growable: false);
      return movies;
    } on DioError catch (dioError) {
      throw MoviesException.fromDioError(dioError);
    }
  }
}
