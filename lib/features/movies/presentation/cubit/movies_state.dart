abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoadedLoading extends MoviesState {}

class MoviesLoadedSuccess extends MoviesState {}

class MoviesLoadedError extends MoviesState {
  final String message;

  MoviesLoadedError(this.message);
}

