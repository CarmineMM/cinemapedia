import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repositorio inmutable
/// Información de los providers de movies
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDBDataSource());
});
