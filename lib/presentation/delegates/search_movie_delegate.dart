import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback onSearch;
  final StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debounceTimer;
  List<Movie> initialMovies;

  SearchMovieDelegate({required this.onSearch, this.initialMovies = const []});

  @override
  String get searchFieldLabel => 'Buscar Película';

  void _onQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 400), () async {
      final movies = await onSearch(query);
      initialMovies = movies;
      debouncedMovies.add(movies);
    });
  }

  void _cleanStreams() {
    _debounceTimer?.cancel();
    debouncedMovies.close();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      ZoomIn(
        duration: const Duration(milliseconds: 200),
        animate: query.isNotEmpty,
        child: IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _cleanStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return buildResultAndSuggestions();
  }

  /// Construye las respuesta de build result
  Widget buildResultAndSuggestions() {
    return StreamBuilder(
      stream: debouncedMovies.stream,
      initialData: initialMovies,
      builder: (BuildContext context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder:
              (BuildContext context, int index) => ListTile(
                title: _MovieItem(
                  movie: movies[index],
                  onSelect: (BuildContext context, Movie? movie) {
                    close(context, movie);
                    _cleanStreams();
                  },
                ),
              ),
        );
      },
    );
  }
}

typedef OnSelectMovie = Function(BuildContext context, Movie? movie);

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final OnSelectMovie onSelect;

  const _MovieItem({required this.movie, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).textTheme;
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onSelect(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // La imagen
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) {
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),

            const SizedBox(width: 10),

            // La descripción y titulo
            SizedBox(
              width: size.width * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyle.titleMedium),
                  Text(
                    movie.overview.length > 100
                        ? '${movie.overview.substring(0, 100)}...'
                        : movie.overview,
                    maxLines: 3,
                    style: textStyle.bodySmall,
                  ),

                  Row(
                    children: [
                      Icon(Icons.star_half, color: Colors.yellow.shade800),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, decimalDigits: 1),
                        style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade900),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
