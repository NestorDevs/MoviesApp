import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movie_app/presentation/widgets/widgets.dart';

import 'movie_carousel/movie_carousel_widget.dart';
import 'movie_tabbed/movie_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => movieCarouselBloc),
        BlocProvider(create: (_) => movieBackdropBloc),
        BlocProvider(create: (_) => movieTabbedBloc),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  ),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                errorType: state.errorType,
                onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
