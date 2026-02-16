import 'package:movies_clean_arch_mvvm/core/app_imports.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl:Constants.baseUrl)
abstract class AppServicesClint {
  factory AppServicesClint(Dio dio, {String? baseUrl}) = _AppServicesClint;

  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies(
      @Query('api_key')String apiKey
      );
  //
  // @GET('movie/upcoming')
  // Future<List<MovieResponse>> getUpComingMovies(
  //     @Field('api_key')String apiKey
  //
  //     );
  //
  // @GET('movie/top_rated')
  // Future<List<MovieResponse>> getTopRatedMovies(
  //     @Field('api_key')String apiKey
  //
  //     );
}
//   Dio dio = Dio();
//     try {
//       final response = await dio.get(
//         'https://api.themoviedb.org/3/movie/upcoming?api_key=a497f504b6673dad3325dbad736632a0',
//       );
//       if (response.statusCode == 200) {
//         return List<MovieResponse>.from(
//           response.data['results'].map((x) => MovieResponse.fromJson(x)),
//         ).toList();
//       } else {
//         return throw Exception(StringManager.failedToLoadData);
//       }
//     } on Exception catch (e) {
//       print(e);
//       return throw Exception(StringManager.failedToLoadData);
//     }