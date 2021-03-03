import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/common.dart';
import '../../../common/constants/translation_constants.dart';
import '../../blocs/videos/videos_bloc.dart';
import '../../widgets/widgets.dart';
import '../watch_videos/watch_video_arguments.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key key,
    this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
            text: TranslationConstants.watchTrailers,
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.watchTrailer,
                  arguments: WatchVideoArguments(_videos));
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
