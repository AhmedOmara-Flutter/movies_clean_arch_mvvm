// import 'package:dio/dio.dart';
//
// import '../models/movies_response.dart';
//
// abstract class RemoteDataSource {
//   Future<MoviesResponse> getDetailsMovies(String movie);
// }
//
// class RemoteDataSourceImpl implements RemoteDataSource {
//   @override
//   Future<MoviesResponse> getDetailsMovies(String movie) async {
//     Dio dio = Dio();
//     try {
//       final response = await dio.get(
//         'https://www.omdbapi.com/?t=$movie&apikey=7af9b638',
//       );
//       if (response.statusCode == 200) {
//         print(response.data);
//         return MoviesResponse.fromJson(response.data);
//       } else {
//         print(response.statusCode);
//         return throw Exception('Failed to load data');
//       }
//     } on Exception catch (e) {
//       print(e);
//       return throw Exception('Failed to load data');
//     }
//   }
// }
