import 'package:json_annotation/json_annotation.dart';
import 'package:movie_list/configs/urls.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {

  final int id;
  final String image;
  final String poster;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.id,
    required this.image,
    required this.poster,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      id: _json["id"],
      image: Urls.getImagePath(_json["backdrop_path"] as String),
      poster: Urls.getImagePath(_json["poster_path"] as String),
      originalTitle: _json["original_title"],
      overview: _json["overview"],
      popularity: double.parse("${_json["popularity"]}"),
      releaseDate: _json["release_date"],
      title: _json["title"],
      voteAverage: double.parse("${_json["vote_average"]}"),
      voteCount: int.parse("${_json["vote_count"]}"),
    );
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);

}