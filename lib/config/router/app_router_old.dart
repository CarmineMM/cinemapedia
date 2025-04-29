import 'package:cinemapedia/presentation/screens/movies/movie_screen.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.routePath,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) {
        return HomeScreen(currentChild: child);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: HomeScreen.routePath,
              name: HomeScreen.routeName,
              builder: (context, state) => const HomeView(),
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
        ),

        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: FavoritesView.routePath,
              name: FavoritesView.routeName,
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),
      ],
    ),

    // Rutas padre e hijo
    // GoRoute(
    //   name: HomeScreen.routeName,
    //   path: HomeScreen.routePath,
    //   builder: (BuildContext context, GoRouterState state) => HomeScreen(childView: HomeView()),
    //   routes: [
    //     GoRoute(
    //       name: MovieScreen.routeName,
    //       path: MovieScreen.routePath,
    //       builder:
    //           (BuildContext context, GoRouterState state) =>
    //               MovieScreen(movieId: state.pathParameters['id'] ?? 'no-id'),
    //     ),
    //   ],
    // ),
  ],
);
