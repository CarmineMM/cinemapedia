import 'package:cinemapedia/config/constants/environment.dart';
import 'package:dio/dio.dart';

final dioAdapter = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {'language': 'es-MX'},
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Environment.theMovieDdKey}',
    },
  ),
);
