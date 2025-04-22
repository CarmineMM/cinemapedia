import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_horizontal_list_view.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const routePath = '/';
  static const routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    // El loader puede prevenir que se haga un watch sobre los movies providers
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          elevation: 1,
          title: CustomAppBar(),
          // flexibleSpace: FlexibleSpaceBar(title: ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            return Column(
              children: [
                MoviesSlideshow(movies: moviesSlideshow),
                const SizedBox(height: 30),

                MoviesHorizontalListView(
                  movies: nowPlayingMovies,
                  label: 'En cines',
                  badge: 'Lunes 20',
                  loadNextPage:
                      () =>
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: upComingMovies,
                  label: 'Próximamente',
                  badge: 'Este mes',
                  loadNextPage:
                      () =>
                          ref
                              .read(upComingMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: popularMovies,
                  label: 'Populares',
                  // badge: 'Este mes',
                  loadNextPage:
                      () =>
                          ref
                              .read(popularMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                MoviesHorizontalListView(
                  movies: topRatedMovies,
                  label: 'Mejor calificados',
                  badge: 'Desde siempre',
                  loadNextPage:
                      () =>
                          ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage(),
                ),

                const SizedBox(height: 30),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
