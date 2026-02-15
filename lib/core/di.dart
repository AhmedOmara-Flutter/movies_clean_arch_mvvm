import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

final instance = GetIt.instance;

void initAppModule() {
  /// remoteDataSource
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  /// localDataSource
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  /// repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance(), instance()),
  );

  /// useCase
  instance.registerLazySingleton<NowPlayingUseCase>(
    () => NowPlayingUseCase(instance()),
  );
  instance.registerLazySingleton<UpComingUseCase>(
    () => UpComingUseCase(instance()),
  );
  instance.registerLazySingleton<TopRatedUseCase>(
    () => TopRatedUseCase(instance()),
  );
}
