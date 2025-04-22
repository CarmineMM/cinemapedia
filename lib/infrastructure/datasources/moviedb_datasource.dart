import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDataSource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {'language': 'es-MX'},
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Environment.theMovieDdKey}',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies =
        movieDbResponse.results
            .where((movie) => movie.posterPath != MovieMapper.notFoundPoster)
            .map((result) => MovieMapper.movieDBToEntity(result))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    try {
      final response = await dio.get(
        'movie/now_playing',
        queryParameters: {'page': page},
      );

      return _jsonToMovies(response.data);
    } catch (e) {
      print('Error $e');
      print('Headers ${Environment.theMovieDdKey}');
      return [];
    }
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    try {
      final response = await dio.get(
        'movie/popular',
        queryParameters: {'page': page},
      );

      return _jsonToMovies(response.data);
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    try {
      final response = await dio.get(
        'movie/top_rated',
        queryParameters: {'page': page},
      );

      return _jsonToMovies(response.data);
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    try {
      final response = await dio.get(
        'movie/upcoming',
        queryParameters: {'page': page},
      );

      return _jsonToMovies(response.data);
    } catch (e) {
      return [];
    }
  }
}
