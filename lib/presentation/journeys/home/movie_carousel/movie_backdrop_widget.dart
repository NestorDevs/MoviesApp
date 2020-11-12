import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_app/common/extensions/extensions.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/screenutil/screen_util.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieBackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //9
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      //8
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_40.w),
        ),
        //4
        child: Stack(
          children: <Widget>[
            //5
            FractionallySizedBox(
              heightFactor: 1, widthFactor: 1,
              //1
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                builder: (context, state) {
                  if (state is MovieBackdropChanged) {
                    //2
                    return CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  //3
                  return const SizedBox.shrink();
                },
              ),
            ),
            //6
            BackdropFilter(
              //7
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
