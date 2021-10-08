import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/color_utils_lib.dart';

class VzText extends Text {
  late final String data;
  late final int maxlines;
  final TextStyle? textStyleCustom;
  final Color? color;
  TextOverflow? overflow;

  VzText.typePrimary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body2,
    this.maxlines = 10,
    this.color,
    this.textStyleCustom,
    this.overflow,
  }) : super(data,
            overflow: overflow,
            maxLines: maxlines,
            style: textStyleCustom ??
                style.textStyle.copyWith(
                  color: color ?? ColorUtils.colorStyle(VzTextType.typePrimary),
                ));

  VzText.typeSecondary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body2,
    this.maxlines = 10,
    this.color,
    this.textStyleCustom,
    this.overflow,
  }) : super(
          data,
          maxLines: maxlines,
          overflow: overflow,
          style: textStyleCustom ??
              style.textStyle.copyWith(
                color: color ?? ColorUtils.colorStyle(VzTextType.typeSecondary),
              ),
        );

  VzText.typeTertiary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body2,
    this.maxlines = 10,
    this.color,
    this.textStyleCustom,
    this.overflow,
  }) : super(
          data,
          maxLines: maxlines,
          overflow: overflow,
          style: textStyleCustom ??
              style.textStyle.copyWith(
                color: color ?? ColorUtils.colorStyle(VzTextType.typeTertiary),
              ),
        );
}
