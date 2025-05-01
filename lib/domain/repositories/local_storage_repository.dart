import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepository(this.datasource);

  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(Movie movie);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
