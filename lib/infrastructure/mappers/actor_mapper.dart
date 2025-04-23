import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/actor_moviedb.dart';

class ActorMapper {
  static const String imageBasePath = 'https://image.tmdb.org/t/p/w500';

  static Actor actorDBToEntity(ActorMovieDb actor) => Actor(
    id: actor.id,
    name: actor.name,
    profilePath:
        actor.profilePath != null
            ? "$imageBasePath/${actor.profilePath}"
            : 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhh0KQVofH8PF5D-6ftUhrc-fTrvluxLkdAIdepSQFi3zBjM49ILYkS9XOCoK2cWxp7TuugJpY9zaFALvRumKklTtVIcQDmX66CtE3cJ057k4GIHz5T6Du_JUAwlvDtnKfhCs_I29of84GJ/s640/facebook-default-no-profile-pic.jpg',
    character: actor.character,
    originalName: actor.originalName,
  );
}
