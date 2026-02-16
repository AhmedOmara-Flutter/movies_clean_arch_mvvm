import 'package:dartz/dartz.dart';
import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class NowPlayingUseCase extends BaseUseCase {
  final Repository _repository;

  NowPlayingUseCase(this._repository);

  @override
  Future<Either<Failure,Movie>> execute() async {
    return await _repository.getNowPlayingMovies();
  }
}
