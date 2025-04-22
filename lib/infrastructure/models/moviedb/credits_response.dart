import 'package:cinemapedia/infrastructure/models/moviedb/actor_moviedb.dart';

class CreditsResponse {
  final int id;
  final List<ActorMovieDb> cast;
  final List<ActorMovieDb> crew;

  CreditsResponse({required this.id, required this.cast, required this.crew});

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      CreditsResponse(
        id: json["id"],
        cast: List<ActorMovieDb>.from(
          json["cast"].map((x) => ActorMovieDb.fromJson(x)),
        ),
        crew: List<ActorMovieDb>.from(
          json["crew"].map((x) => ActorMovieDb.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
}
