// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      image: json['image'] as String,
      poster: json['poster'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['releaseDate'] as String,
      title: json['title'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'poster': instance.poster,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
