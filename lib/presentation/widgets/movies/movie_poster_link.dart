import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/screens/movies/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;

  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.pushNamed(
            MovieScreen.routeName,
            pathParameters: {'id': movie.id.toString(), 'screen': '2'},
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInUp(child: Image.network(movie.posterPath, fit: BoxFit.cover)),
      ),
    );
  }
}
