import 'package:dartz/dartz.dart';
import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class UpComingUseCase extends BaseUseCase {
  final Repository _repository;

  UpComingUseCase(this._repository);

  @override
  Future<Either<Failure,List<Movie>>> execute() async {
    return await _repository.getUpComingMovies();
  }
}
