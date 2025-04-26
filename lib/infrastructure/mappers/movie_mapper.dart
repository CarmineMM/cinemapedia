import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static const String imageBasePath = 'https://image.tmdb.org/t/p/w500';
  static const String notFoundImage =
      'https://cdn.displate.com/artwork/270x380/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg';
  static const String notFoundPoster = 'no-poster';

  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath:
        moviedb.backdropPath != ''
            ? '$imageBasePath/${moviedb.backdropPath}'
            : notFoundImage,
    genreIds: moviedb.genreIds,
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath:
        moviedb.posterPath != ''
            ? '$imageBasePath${moviedb.posterPath}'
            : notFoundImage,
    releaseDate: moviedb.releaseDate ?? DateTime.now(),
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath:
        moviedb.backdropPath != ''
            ? '$imageBasePath/${moviedb.backdropPath}'
            : notFoundImage,
    genres: moviedb.genres,
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath:
        moviedb.posterPath != ''
            ? '$imageBasePath${moviedb.posterPath}'
            : notFoundImage,
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
