import 'package:movies_clean_arch_mvvm/core/app_imports.dart';
import 'package:retrofit/retrofit.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: '')
abstract class AppServicesClint {
  factory AppServicesClint(Dio dio, {required String baseUrl}) =>
      _AppServicesClint(dio);

  @GET('/popular')
  Future<List<MovieResponse>> getPopularMovies();
}
