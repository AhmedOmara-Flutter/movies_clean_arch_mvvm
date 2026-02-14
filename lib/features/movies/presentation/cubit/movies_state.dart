abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class NowPlayingMoviesLoadedLoading extends MoviesState {

}

class NowPlayingMoviesLoadedSuccess extends MoviesState {
  // final List<Movie> movies;
  //
  // NowPlayingMoviesLoadedSuccess(this.movies);
}

class NowPlayingMoviesLoadedError extends MoviesState {
  final String message;

  NowPlayingMoviesLoadedError(this.message);
}
