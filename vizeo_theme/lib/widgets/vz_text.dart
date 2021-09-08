import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/color_utils_lib.dart';

class VzText extends Text {
  late String data;
  late final int maxlines;
  late final TypeDeTextStyle type;
  late final Color? color;

  VzText.typePrimary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.maxlines = 10,
    this.color,
  }) : super(
          data,
          maxLines: maxlines,
          style: style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typePrimary),
          ),
        );

  VzText.typeSecondary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.maxlines = 10,
    this.color,
  }) : super(
          data,
          maxLines: maxlines,
          style: style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typeSecondary),
          ),
        );

  VzText.typeTertiary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.maxlines = 10,
    this.color,
  }) : super(
          data,
          maxLines: maxlines,
          style: style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typeTertiary),
          ),
        );
}
