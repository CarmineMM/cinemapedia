import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorsDBDatasource implements ActorsDatasource {
  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    throw UnimplementedError();
  }
}
