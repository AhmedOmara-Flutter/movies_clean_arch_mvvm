import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

import 'dio_factory.dart';

final instance = GetIt.instance;

void initAppModule() async{

  /// DioFactory

  instance.registerLazySingleton<DioFactory>(() => DioFactory());


  /// AppServicesClint
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServicesClint>(() => AppServicesClint(dio));

  /// remoteDataSource
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance()),
  );

  // /// localDataSource
  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  //
  /// repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance()),
  );

  /// useCase
  instance.registerLazySingleton<NowPlayingUseCase>(
    () => NowPlayingUseCase(instance()),
  );
  // instance.registerLazySingleton<UpComingUseCase>(
  //   () => UpComingUseCase(instance()),
  // );
  // instance.registerLazySingleton<TopRatedUseCase>(
  //   () => TopRatedUseCase(instance()),
  // );
}
