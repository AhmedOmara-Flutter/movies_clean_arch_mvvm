import 'package:dartz/dartz.dart';
import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

abstract class Repository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}