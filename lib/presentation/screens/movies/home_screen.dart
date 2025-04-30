import 'package:cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const routePath = '/home/:screen';
  static const routeName = 'home';

  // final StatefulNavigationShell currentChild;
  final int pageIndex;
  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(), // <-- Categorías
    FavoritesView(),
  ];

  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: viewRoutes),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: pageIndex),
    );
  }
}
