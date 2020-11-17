import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';

abstract class IMovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
}
