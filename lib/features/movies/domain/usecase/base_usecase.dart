import 'package:dartz/dartz.dart';
import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

abstract class BaseUseCase{
  Future<Either<Failure,List<Movie>>> execute();
}
