part of '../common.dart';

extension SizeExtensions on num {
  num get w => ScreenUtil().setWidth(this);

  num get h => ScreenUtil().setHeight(this);

  num get sp => ScreenUtil().setSp(this);
}
