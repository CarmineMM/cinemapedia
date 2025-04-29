import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  static const String routePath = '/favorites';
  static const String routeName = 'favorites';

  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: Center(child: Text('Favoritos')),
    );
  }
}
