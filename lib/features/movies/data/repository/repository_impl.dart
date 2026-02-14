import 'package:dartz/dartz.dart';
import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final movies = await _remoteDataSource.getNowPlayingMovies();
      return Right(movies);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final movies = await _remoteDataSource.getPopularMovies();

    if (movies.isNotEmpty) {
      return Right(movies);
    } else {
      return Left(Failure(message: 'Failed to load movies خلي بالك يا زعيم '));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final movies = await _remoteDataSource.getTopRatedMovies();

    if (movies.isNotEmpty) {
      return Right(movies);
    } else {
      return Left(Failure(message: 'Failed to load movies خلي بالك يا زعيم '));
    }
  }
}

class Failure {
  final String message;

  Failure({required this.message});
}
