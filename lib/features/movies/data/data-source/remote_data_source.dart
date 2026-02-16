import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

abstract class RemoteDataSource {

  Future<MovieResponse> getNowPlayingMovies();
// Future<MovieResponse> getUpComingMovies();
// Future<MovieResponse> getTopRatedMovies();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServicesClint _appServicesClint;

  RemoteDataSourceImpl(this._appServicesClint);

  @override
  Future<MovieResponse> getNowPlayingMovies() async {
    return await _appServicesClint.getPopularMovies(
        'a497f504b6673dad3325dbad736632a0');
  }

// @override
// Future<List<MovieResponse> getUpComingMovies() async {
//   Dio dio = Dio();
//   try {
//     final response = await dio.get(
//       'https://api.themoviedb.org/3/movie/upcoming?api_key=a497f504b6673dad3325dbad736632a0',
//     );
//     if (response.statusCode == 200) {
//       return List<MovieResponse>.from(
//         response.data['results'].map((x) => MovieResponse.fromJson(x)),
//       ).toList();
//     } else {
//       return throw Exception(StringManager.failedToLoadData);
//     }
//   } on Exception catch (e) {
//     print(e);
//     return throw Exception(StringManager.failedToLoadData);
//   }
// }
//
// @override
// Future<List<MovieResponse>> getTopRatedMovies() async {
//   Dio dio = Dio();
//   try {
//     final response = await dio.get(
//       'https://api.themoviedb.org/3/movie/top_rated?api_key=a497f504b6673dad3325dbad736632a0',
//     );
//     if (response.statusCode == 200) {
//       List movieResponse = response.data['results'];
//       return movieResponse
//           .map((element) => MovieResponse.fromJson(element))
//           .toList();
//     } else {
//       return throw Exception(StringManager.failedToLoadData);
//     }
//   } on Exception catch (e) {
//     print(e);
//     return throw Exception(StringManager.failedToLoadData);
//   }
// }
}
