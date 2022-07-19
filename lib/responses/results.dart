import 'package:json_annotation/json_annotation.dart';
import 'movie.dart';

part 'results.g.dart';

@JsonSerializable()
class ResultResponse {

  final int page;
  final int pages;
  final int total;
  final List<Movie> results;

  ResultResponse({
    required this.page,
    required this.pages,
    required this.total,
    required this.results,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> _json) {
    return ResultResponse(
        page: _json["page"],
        pages: _json["total_pages"],
        total: _json["total_results"],
        results: _json.containsKey("results")?List.from(_json["results"]).map((e) =>Movie.fromJson(e)).toList():[]
    );
  }

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);

}