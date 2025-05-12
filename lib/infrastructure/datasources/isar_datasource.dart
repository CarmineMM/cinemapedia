import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([MovieSchema], directory: dir.path, inspector: true);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(Movie movie) async {
    final isar = await db;
    final Movie? isFavoriteMovie = await isar.movies.filter().idEqualTo(movie.id).findFirst();
    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    final List<Movie> movies = await isar.movies.where().offset(offset).limit(limit).findAll();
    return movies;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final isFavorite = await isMovieFavorite(movie);

    /// Borrar o agregar a favoritos
    if (isFavorite) {
      isar.writeTxnSync(() => isar.movies.deleteSync(movie.localId!));
      return;
    }

    // Agregar a favorito
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
