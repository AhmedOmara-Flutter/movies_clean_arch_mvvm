import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this._nowPlayingUseCase,
      // this._upComingUseCase,
      // this._topRatedUseCase
      ) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);
  // final UpComingUseCase _upComingUseCase;
  // final TopRatedUseCase _topRatedUseCase;
  final NowPlayingUseCase _nowPlayingUseCase;

  List<Movie> upComingMovies = [];
  List<Movie> topRatedMovies = [];
  Movie ?nowPlayingMovies;

  Future<void> getNowPlayingMovies() async {
    emit(MoviesLoadedLoading());

    final result = await _nowPlayingUseCase.execute();
    result.fold(
      (failure) {
        emit(MoviesLoadedError(failure.message));
      },
      (data) {
        nowPlayingMovies = data;
        emit(MoviesLoadedSuccess());
      },
    );
  }

  // Future<void> getUpComingMovies() async {
  //   upComingMovies = [];
  //   emit(MoviesLoadedLoading());
  //   final result = await _upComingUseCase.execute();
  //   result.fold((failure) {
  //     emit(MoviesLoadedError(failure.message));
  //   }, (data) {
  //     upComingMovies = data;
  //     emit(MoviesLoadedSuccess());
  //   });
  // }
  //
  // Future<void> getTopRatedMovies() async {
  //   topRatedMovies = [];
  //   emit(MoviesLoadedLoading());
  //   final result = await _topRatedUseCase.execute();
  //   result.fold((failure) {
  //     emit(MoviesLoadedError(failure.message));
  //     }, (data) {
  //     topRatedMovies = data;
  //     emit(MoviesLoadedSuccess());
  //   });
  // }
}
