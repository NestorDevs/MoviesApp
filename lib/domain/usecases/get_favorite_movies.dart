import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/no_params.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repositories/i_movie_repository.dart';
import 'usecase.dart';

class GetFavoriteMovies extends Usecase<List<MovieEntity>, NoParams> {
  final IMovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getFavoriteMovies();
  }
}
