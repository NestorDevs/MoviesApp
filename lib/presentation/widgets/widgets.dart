import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wiredash/wiredash.dart';

import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';
import '../../common/extensions/extensions.dart';
import '../../common/screenutil/screen_util.dart';
import '../../domain/entities/app_error.dart';
import '../blocs/search_movie/search_movie_bloc.dart';
import '../journeys/search_movie/custom_search_movie_delegate.dart';
import '../themes/app_color.dart';

part 'app_dialog.dart';
part 'app_error_widget.dart';
part 'button.dart';
part 'logo.dart';
part 'movie_app_bar.dart';
part 'separator.dart';
