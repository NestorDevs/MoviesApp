import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

// data-layer
import '../data/core/api_client.dart';
import '../data/data_sources/authentication_local_data_source.dart';
import '../data/data_sources/authentication_remote_data_source.dart';
import '../data/data_sources/i_movie_remote_data_source.dart';
import '../data/data_sources/language_local_data_source.dart';
import '../data/data_sources/movie_local_data_source.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/app_repository_impl.dart';
import '../data/repositories/authentication_repository.dart';
import '../data/repositories/movie_repository.dart';

// Domain layer
import '../domain/repositories/i_app_repository.dart';
import '../domain/repositories/i_authentication_repository.dart';
import '../domain/repositories/i_movie_repository.dart';
import '../domain/usecases/check_if_movie_favorite.dart';
import '../domain/usecases/delete_favorite_movie.dart';
import '../domain/usecases/get_cast.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_favorite_movies.dart';
import '../domain/usecases/get_movie_detail.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_preferred_language.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/get_videos.dart';
import '../domain/usecases/login_user.dart';
import '../domain/usecases/logout_user.dart';
import '../domain/usecases/save_movie.dart';
import '../domain/usecases/search_movies.dart';
import '../domain/usecases/update_language.dart';
// presentation layer
import '../presentation/blocs/cast/cast_bloc.dart';
import '../presentation/blocs/favorite/favorite_bloc.dart';
import '../presentation/blocs/language/language_bloc.dart';
import '../presentation/blocs/login/login_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import '../presentation/blocs/movie_detail/movie_detail_bloc.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import '../presentation/blocs/search_movie/search_movie_bloc.dart';
import '../presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  //* Api Instance
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<IMovieRemoteDataSource>(
      () => MovieRemoteDataSource(getItInstance()));

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

  //* UseCases

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

  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
      () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(getItInstance()));

  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  getItInstance
      .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));

  //* Repositories

  getItInstance.registerLazySingleton<IMovieRepository>(() => MovieRepository(
        getItInstance(),
        getItInstance(),
      ));

  getItInstance.registerLazySingleton<IAppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));

  getItInstance.registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()));

  //* Blocs

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
      favoriteBloc: getItInstance(),
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

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));

  getItInstance.registerFactory(
    () => FavoriteBloc(
      getFavoriteMovies: getItInstance(),
      saveMovie: getItInstance(),
      checkIfMovieFavorite: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => LoginBloc(
        loginUser: getItInstance(),
        logoutUser: getItInstance(),
      ));
}
