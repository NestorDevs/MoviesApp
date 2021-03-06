import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/i_movie_repository.dart';
import 'usecase.dart';

class GetComingSoon extends Usecase<List<MovieEntity>, NoParams> {
  final IMovieRepository repository;

  GetComingSoon(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getComingSoon();
  }
}
