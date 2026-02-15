import 'package:dartz/dartz.dart';
import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final movies = await _localDataSource.getHomeData(
          key: Constants.cacheNowPlaying);
      return Right(movies);
    } catch (cacheError) {
      try {
        final movies = await _remoteDataSource.getNowPlayingMovies();
        _localDataSource.saveHomeDataToCache(
            key: Constants.cacheNowPlaying, movies: movies);
        return Right(movies);
      } on Exception catch (e) {
        print(e);
        return Left(Failure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpComingMovies() async {
    try {
      final movies = await _localDataSource.getHomeData(
          key: Constants.cacheUpComing);
      return Right(movies);
    } catch (cacheError) {
      try {
        final movies = await _remoteDataSource.getUpComingMovies();
        _localDataSource.saveHomeDataToCache(
            key: Constants.cacheUpComing, movies: movies);
        return Right(movies);
      } on Exception catch (e) {
        print(e);
        return Left(Failure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final movies = await _localDataSource.getHomeData(
          key: Constants.cacheTopRated);
      return Right(movies);
    } catch (cacheError) {
      try {
        final movies = await _remoteDataSource.getTopRatedMovies();
        _localDataSource.saveHomeDataToCache(
            key: Constants.cacheTopRated, movies: movies);
        return Right(movies);
      } on Exception catch (e) {
        print(e);
        return Left(Failure(message: e.toString()));
      }
    }
  }
}

class Failure {
  final String message;

  Failure({required this.message});
}
