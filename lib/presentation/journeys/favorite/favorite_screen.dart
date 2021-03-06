import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/get_it.dart';
import '../../../common/common.dart';
import 'favorite_movie_grid_view.dart';
import '../../blocs/favorite/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _favoriteBloc = getItInstance<FavoriteBloc>();
    _favoriteBloc.add(LoadFavoriteMovieEvent());
  }

  @override
  void dispose() {
    _favoriteBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationConstants.favoriteMovies.t(context)),
      ),
      body: BlocProvider.value(
        value: _favoriteBloc,
        child:
            BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
          if (state is FavoriteMoviesLoaded) {
            if (state.movies.isEmpty) {
              return Center(
                child: Text(
                  TranslationConstants.noFavoriteMovies.t(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            }
            return FavoriteMovieGridView(movies: state.movies);
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
