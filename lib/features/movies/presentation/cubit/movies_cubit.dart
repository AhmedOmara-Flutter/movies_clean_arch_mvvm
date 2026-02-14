import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.nowPlayingUseCase) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);
  NowPlayingUseCase nowPlayingUseCase;
  List<Movie> nowPlayingMovies = [];

  Future<void> getNowPlayingMovies() async {
    nowPlayingMovies = [];
    emit(NowPlayingMoviesLoadedLoading());

    final result = await nowPlayingUseCase.execute();
    result.fold(
      (failure) {
        emit(NowPlayingMoviesLoadedError(failure.message));
      },
      (data) {
        nowPlayingMovies = data;
        emit(NowPlayingMoviesLoadedSuccess());
      },
    );
  }

  Future<void> getPopularMovies() async {}

  Future<void> getTopRatedMovies() async {}
}
