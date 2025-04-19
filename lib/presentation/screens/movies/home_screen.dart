import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routePath = '/';
  static const routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('HOla');
  }
}
