import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repositories/i_movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetPlayingNow extends Usecase<List<MovieEntity>, NoParams> {
  final IMovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getPlayingNow();
  }
}
