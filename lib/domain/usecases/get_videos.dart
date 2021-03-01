import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_params.dart';
import '../entities/video_entity.dart';
import '../repositories/i_movie_repository.dart';
import 'usecase.dart';

class GetVideos extends Usecase<List<VideoEntity>, MovieParams> {
  final IMovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getVideos(movieParams.id);
  }
}
