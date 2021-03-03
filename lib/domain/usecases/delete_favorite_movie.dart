import 'package:dartz/dartz.dart';

import 'usecase.dart';
import '../entities/app_error.dart';
import '../entities/movie_params.dart';
import '../repositories/i_movie_repository.dart';

class DeleteFavoriteMovie extends Usecase<void, MovieParams> {
  final IMovieRepository movieRepository;

  DeleteFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavoriteMovie(movieParams.id);
  }
}
