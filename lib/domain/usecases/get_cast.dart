import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/cast_entity.dart';
import '../entities/movie_params.dart';
import '../repositories/i_movie_repository.dart';
import 'usecase.dart';

class GetCast extends Usecase<List<CastEntity>, MovieParams> {
  final IMovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}
