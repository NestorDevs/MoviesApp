import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common.dart';
import '../../../data/core/api_constants.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../blocs/favorite/favorite_bloc.dart';
import '../movie_detail/movie_detail_arguments.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      child: Container(
        margin: EdgeInsets.only(bottom: Sizes.dimen_8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(RouteList.movieDetail,
                arguments: MovieDetailArguments(movie.id));
          },
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => BlocProvider.of<FavoriteBloc>(context)
                        .add(DeleteFavoriteMovieEvent(movie.id)),
                    child: Padding(
                      padding: EdgeInsets.all(Sizes.dimen_12.w),
                      child: Icon(
                        Icons.delete,
                        size: Sizes.dimen_12.h,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
