import 'package:json_annotation/json_annotation.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class ResultsResponse {
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  ResultsResponse({
    this.genreIds,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    });

  factory ResultsResponse.fromJson(Map<String, dynamic> json)=> _$ResultsResponseFromJson(json);


  Map<String, dynamic> toJson() => _$ResultsResponseToJson(this);


}

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<ResultsResponse>? resultsResponse;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  MovieResponse({this.page, this.resultsResponse, this.totalPages, this.totalResults});

  factory MovieResponse.fromJson(Map<String, dynamic> json)=>
      _$MovieResponseFromJson(json);


  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

}
