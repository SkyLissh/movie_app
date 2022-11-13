import "dart:convert";

import "movie.dart";

class MovieResponse {
  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  factory MovieResponse.fromJson(String str) =>
      MovieResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
