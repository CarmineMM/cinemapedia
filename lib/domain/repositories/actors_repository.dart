import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsRepository {
  final ActorsDatasource datasource;

  ActorsRepository(this.datasource);

  Future<List<Actor>> getActorsByMovieId(String movieId);
}
