import 'package:flutter/material.dart';

import '../common/common.dart';
import 'journeys/favorite/favorite_screen.dart';
import 'journeys/home/home_screen.dart';
import 'journeys/login/login_screen.dart';
import 'journeys/movie_detail/movie_detail_screen.dart';
import 'journeys/watch_videos/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => LoginScreen(),
        RouteList.home: (context) => HomeScreen(),
        RouteList.movieDetail: (context) =>
            MovieDetailScreen(movieDetailArguments: settings.arguments),
        RouteList.watchTrailer: (context) =>
            WatchVideoScreen(watchVideoArguments: settings.arguments),
        RouteList.favorite: (context) => FavoriteScreen(),
      };
}
