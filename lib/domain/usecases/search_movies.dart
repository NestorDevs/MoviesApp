import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../entities/movie_search_params.dart';
import '../repositories/i_movie_repository.dart';
import 'usecase.dart';

class SearchMovies extends Usecase<List<MovieEntity>, MovieSearchParams> {
  final IMovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams searchParams) async {
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}
