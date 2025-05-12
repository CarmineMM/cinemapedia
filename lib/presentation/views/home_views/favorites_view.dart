import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  static const String routePath = '/favorites';
  static const String routeName = 'favorites';

  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;

    final moviesResponse = await ref.read(favoriteMoviesProvider.notifier).loadMovies();

    isLoading = false;

    if (moviesResponse.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: MoviesMasonry(movies: favoriteMovies, onLoadNextPage: loadNextPage),
    );
  }
}
