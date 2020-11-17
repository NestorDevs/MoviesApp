import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/i_movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetMovieDetail extends Usecase<MovieDetailEntity, MovieParams> {
  final IMovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
