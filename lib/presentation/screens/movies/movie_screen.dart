import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  static const routePath = 'movie/:id';
  static const routeName = 'movie.find';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Movie ${widget.movieId}')));
  }
}
