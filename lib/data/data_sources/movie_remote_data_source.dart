import '../core/api_client.dart';
import '../models/movie_model.dart';
import '../models/video_model.dart';
import 'i_movie_remote_data_source.dart';
import '../models/movie_detail_model.dart';
import '../models/video_result_model.dart';
import '../models/movies_result_model.dart';
import '../models/cast_crew_result_data_model.dart';

class MovieRemoteDataSource implements IMovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSource(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');

    return MoviesResultModel.fromJson(response).movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');

    return MoviesResultModel.fromJson(response).movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    return MoviesResultModel.fromJson(response).movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    return MoviesResultModel.fromJson(response).movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final video = VideoResultModel.fromJson(response).videos;
    print(video);
    return video;
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final response = await _client.get('search/movie', params: {
      'query': searchTerm,
    });
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
