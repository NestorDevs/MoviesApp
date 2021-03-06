import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../cast/cast_bloc.dart';
import '../videos/videos_bloc.dart';
import '../favorite/favorite_bloc.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/get_movie_detail.dart';
import '../../../domain/entities/movie_detail_entity.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;

  MovieDetailBloc({
    @required this.getMovieDetail,
    @required this.castBloc,
    @required this.videosBloc,
    @required this.favoriteBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(
        MovieParams(event.movieId),
      );

      yield eitherResponse.fold(
        (l) => MovieDetailError(),
        (r) => MovieDetailLoaded(r),
      );

      favoriteBloc.add(CheckIfFavoriteMovieEvent(event.movieId));
      castBloc.add(LoadCastEvent(movieId: event.movieId));
      videosBloc.add(LoadVideosEvent(event.movieId));
    }
  }
}
