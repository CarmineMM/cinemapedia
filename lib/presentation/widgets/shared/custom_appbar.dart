import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // color: Colors.red,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: theme.textTheme.titleMedium),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final movieRepository = ref.read(movieRepositoryProvider);
                  showSearch(
                    context: context,
                    delegate: SearchMovieDelegate(
                      onSearch: movieRepository.search,
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
