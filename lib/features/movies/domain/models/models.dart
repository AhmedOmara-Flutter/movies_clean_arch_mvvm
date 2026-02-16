class Result {
  List<int> genreIds;
  int id;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;

  Result(this.genreIds, this.id, this.overview, this.posterPath,
      this.releaseDate, this.title, this.voteAverage);

}


class Movie {
  int page;
  List<Result>? results;
  int totalPages;
  int totalResults;

  Movie(this.page, this.results, this.totalPages, this.totalResults);


}