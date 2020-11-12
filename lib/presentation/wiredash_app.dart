import 'package:flutter/material.dart';
import 'package:movie_app/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;
  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movieapp-waj0y5l',
      secret: 'wvt7wt52zrcju6wllx059eqnlc4awid8',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
          locale: Locale.fromSubtags(
        languageCode: languageCode,
      )),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.vulcan,
        dividerColor: AppColor.vulcan,
      ),
    );
  }
}
