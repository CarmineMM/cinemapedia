import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadMovies() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 15);

    page++;

    state = {...state, ...Map.fromEntries(movies.map((e) => MapEntry(e.id, e)))};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    /// Modificar la base de datos de Local
    await localStorageRepository.toggleFavorite(movie);
    final bool isFavorite = state[movie.id] != null;

    if (isFavorite) {
      state = {...state..remove(movie.id)};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
