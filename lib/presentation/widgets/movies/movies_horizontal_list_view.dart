import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? label;
  final String? badge;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListView({
    super.key,
    required this.movies,
    this.label,
    this.badge,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(children: [if (label != null || badge != null) _Title()]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? badge;

  const _Title({this.title, this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(title ?? '', style: const TextStyle(fontSize: 20)),
    );
  }
}
