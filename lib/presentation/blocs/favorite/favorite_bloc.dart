import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/save_movie.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/get_favorite_movies.dart';
import '../../../domain/usecases/delete_favorite_movie.dart';
import '../../../domain/usecases/check_if_movie_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfMovieFavorite;

  FavoriteBloc({
    @required this.saveMovie,
    @required this.getFavoriteMovies,
    @required this.deleteFavoriteMovie,
    @required this.checkIfMovieFavorite,
  }) : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response =
          await checkIfMovieFavorite(MovieParams(event.movieEntity.id));
      yield response.fold(
        (l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(r),
      );
    } else if (event is LoadFavoriteMovieEvent) {
      yield* _fecthLoadFavoriteMovies();
    } else if (event is DeleteFavoriteMovieEvent) {
      await deleteFavoriteMovie(MovieParams(event.movieId));
      yield* _fecthLoadFavoriteMovies();
    } else if (event is CheckIfFavoriteMovieEvent) {
      final response = await checkIfMovieFavorite(MovieParams(event.movieId));
      yield response.fold(
        (l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(r),
      );
    }
  }

  Stream<FavoriteState> _fecthLoadFavoriteMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());
    yield response.fold(
      (l) => FavoriteMoviesError(),
      (r) => FavoriteMoviesLoaded(r),
    );
  }
}
