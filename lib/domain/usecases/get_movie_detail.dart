import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_params.dart';
import '../repositories/i_movie_repository.dart';
import 'usecase.dart';

class GetMovieDetail extends Usecase<MovieDetailEntity, MovieParams> {
  final IMovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
