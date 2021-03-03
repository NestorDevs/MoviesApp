import 'package:flutter/material.dart';

import 'movie_page_view.dart';
import 'movie_data_widget.dart';
import 'movie_backdrop_widget.dart';
import '../../../widgets/widgets.dart';
import '../../../../domain/entities/movie_entity.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key key,
    @required this.movies,
    @required this.defaultIndex,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        SingleChildScrollView(
          child: Column(
            children: [
              MovieAppBar(),
              MoviePageView(
                movies: movies,
                initialPage: defaultIndex,
              ),
              MovieDataWidget(),
              Separator(),
            ],
          ),
        ),
      ],
    );
  }
}
