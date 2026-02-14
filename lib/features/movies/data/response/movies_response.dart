import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class MovieResponse extends Movie {
  const MovieResponse({
    required super.title,
    required super.year,
    required super.poster,
    required super.id,
    required super.overview,
    required super.voteAverage,
    required super.genreIds,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      title: json['title']??'',
      year: json['year']??'',
      poster: json['poster_path']??'',
      id: json['id']??0,
      overview: json['overview']??'',
      voteAverage: json['vote_average']??'',
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)??[]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'poster_path': poster,
      'id': id,
      'overview': overview,
      'vote_average': voteAverage,
      'genre_ids': genreIds,
    };
  }
}
