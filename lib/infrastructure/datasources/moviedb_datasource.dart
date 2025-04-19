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

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('movie/now_playing');

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        movieDbResponse.results
            .where((movie) => movie.posterPath != MovieMapper.notFoundPoster)
            .map((result) => MovieMapper.movieDBToEntity(result))
            .toList();

    return movies;
  }
}
