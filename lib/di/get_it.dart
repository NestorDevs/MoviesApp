import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';
import 'package:movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';

// data-layer
import '../data/core/api_client.dart';
import '../data/repositories/movie_repository.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/data_sources/i_movie_remote_data_source.dart';

// Domain layer
import '../domain/usecases/get_cast.dart';
import '../domain/usecases/get_videos.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_movie_detail.dart';
import '../domain/repositories/i_movie_repository.dart';

// presentation layer
import '../presentation/blocs/cast/cast_bloc.dart';
import '../presentation/blocs/videos/videos_bloc.dart';
import '../presentation/blocs/language/language_bloc.dart';
import '../presentation/blocs/movie_detail/movie_detail_bloc.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<IMovieRemoteDataSource>(
      () => MovieRemoteDataSource(getItInstance()));

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance.registerLazySingleton<GetVideos>(() => GetVideos(
        getItInstance(),
      ));

  getItInstance.registerLazySingleton<IMovieRepository>(
      () => MovieRepository(getItInstance()));

  getItInstance.registerFactory(() => MovieCarouselBloc(
        getTrending: getItInstance(),
        movieBackdropBloc: getItInstance(),
      ));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getPopular: getItInstance(),
        getComingSoon: getItInstance(),
        getPlayingNow: getItInstance(),
      ));

  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => CastBloc(
      getCast: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => VideosBloc(
      getVideos: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => SearchMovieBloc(
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
