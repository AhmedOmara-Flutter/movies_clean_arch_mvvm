import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String year;
  final String poster;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  const Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.id,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
  });

  @override
  List<Object?> get props => [
    title,
    year,
    poster,
    id,
    overview,
    voteAverage,
    genreIds,
  ];
}
