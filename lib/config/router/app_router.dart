import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: HomeScreen.routePath,
  routes: <RouteBase>[
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routePath,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
