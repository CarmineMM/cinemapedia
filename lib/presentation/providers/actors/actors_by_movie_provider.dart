import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<
  ActorByMovieMapProvider,
  Map<String, List<Actor>>
>((ref) {
  final actorRepository = ref.watch(actorsRepositoryProvider);

  return ActorByMovieMapProvider(getActors: actorRepository.getActorsByMovieId);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorByMovieMapProvider extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorByMovieMapProvider({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
