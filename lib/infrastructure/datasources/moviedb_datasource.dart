import 'package:cinemapedia/config/network/adapters/http_dio.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDBDataSource extends MoviesDatasource {
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
      final response = await dioAdapter.get(
        'movie/now_playing',
        queryParameters: {'page': page},
      );

      return _jsonToMovies(response.data);
    } catch (e) {
      // print('Error $e');
      // print('Headers ${Environment.theMovieDdKey}');
      return [];
    }
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    try {
      final response = await dioAdapter.get(
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
      final response = await dioAdapter.get(
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
      final response = await dioAdapter.get(
        'movie/upcoming',
        queryParameters: {'page': page},
      );

      return _jsonToMovies(response.data);
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Movie> findById(String id) async {
    final response = await dioAdapter.get('movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailToEntity(movieDetails);

    return movie;
  }
}
