import 'package:dartz/dartz.dart';

import 'usecase.dart';
import '../entities/app_error.dart';
import '../entities/movie_params.dart';
import '../repositories/i_movie_repository.dart';

class CheckIfFavoriteMovie extends Usecase<bool, MovieParams> {
  final IMovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfFavoriteMovie(movieParams.id);
  }
}
