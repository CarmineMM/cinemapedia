import 'package:cinemapedia/config/network/adapters/http_dio.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorsDBDatasource implements ActorsDatasource {
  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dioAdapter.get('/movie/$movieId/credits');

    final List<Actor> actors =
        CreditsResponse.fromJson(
          response.data,
        ).cast.map((actor) => ActorMapper.actorDBToEntity(actor)).toList();

    return actors;
  }
}
