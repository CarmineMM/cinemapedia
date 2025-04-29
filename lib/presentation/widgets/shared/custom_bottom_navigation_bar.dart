import 'package:cinemapedia/presentation/screens/movies/home_screen.dart';
import 'package:cinemapedia/presentation/views/home_views/favorites_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell currentChild;

  const CustomBottomNavigationBar({super.key, required this.currentChild});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentChild.currentIndex,
      onTap: (value) => currentChild.goBranch(value),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'Categorías'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
      ],
    );
  }
}
