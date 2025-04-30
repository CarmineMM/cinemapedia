import 'package:cinemapedia/presentation/screens/movies/movie_screen.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.routePath,
  routes: <RouteBase>[
    // Rutas padre e hijo
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen(pageIndex: int.parse(state.pathParameters['page'] ?? '0'));
      },
      routes: [
        GoRoute(
          name: MovieScreen.routeName,
          path: MovieScreen.routePath,
          builder:
              (BuildContext context, GoRouterState state) =>
                  MovieScreen(movieId: state.pathParameters['id'] ?? 'no-id'),
        ),
      ],
    ),
  ],
);
