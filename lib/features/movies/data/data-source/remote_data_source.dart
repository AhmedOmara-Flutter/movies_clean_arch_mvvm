import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

abstract class RemoteDataSource {
  Future<List<MovieResponse>> getPopularMovies();

  Future<List<MovieResponse>> getNowPlayingMovies();

  Future<List<MovieResponse>> getTopRatedMovies();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<MovieResponse>> getNowPlayingMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a497f504b6673dad3325dbad736632a0',
      );
      if (response.statusCode == 200) {
        print(response.data);
        return List<MovieResponse>.from(
          response.data['results'].map((x) => MovieResponse.fromJson(x)),
        ).toList();
      } else {
        print(response.statusCode);
        return throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      print(e);
      return throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<MovieResponse>> getPopularMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=a497f504b6673dad3325dbad736632a0',
      );
      if (response.statusCode == 200) {
        print(response.data);
        return List<MovieResponse>.from(
          response.data['results'].map((x) => MovieResponse.fromJson(x)),
        ).toList();
      } else {
        print(response.statusCode);
        return throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      print(e);
      return throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<MovieResponse>> getTopRatedMovies() async {
    Dio dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=a497f504b6673dad3325dbad736632a0',
      );
      if (response.statusCode == 200) {
        List movieResponse = response.data['results'];
        return movieResponse
            .map((element) => MovieResponse.fromJson(element))
            .toList();
      } else {
        print(response.statusCode);
        return throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      print(e);
      return throw Exception('Failed to load data');
    }
  }
}
