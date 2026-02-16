import 'package:movies_clean_arch_mvvm/core/app_imports.dart';
import 'package:movies_clean_arch_mvvm/core/extension.dart';

extension ResultResponseExtension on ResultsResponse? {
  Result toDomain() {
    return Result(
      this?.genreIds ?? [],
      this?.id.orZero() ?? 0,
      this?.overview.orEmpty() ?? "",
      this?.posterPath.orEmpty() ?? "",
      this?.releaseDate.orEmpty() ?? "",
      this?.title.orEmpty() ?? "",
      this?.voteAverage.orDouble() ?? 0.0,
    );
  }
}

extension MovieResponseExtention on MovieResponse? {

  Movie toDomain() {
    final results = (
        this?.resultsResponse
        ?.map((e) => e.toDomain()) ??
        const Iterable<Result>.empty())
        .toList();
    return Movie(
        this?.page.orZero() ?? 0,
        results,
        this?.totalPages.orZero() ?? 0,
        this?.totalPages.orZero() ?? 0);
  }}