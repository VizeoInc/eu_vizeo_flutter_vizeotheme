import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/enum.dart';
import 'package:vizeo_theme/src/private/color_utils_lib.dart';

class VzText extends StatelessWidget {
  const VzText.typePrimary({
    required this.data,
    this.style = TypeDeTextStyle.body2,
    this.maxlines = 1,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.isReadOnly = false,
    this.color,
    this.textStyleCustom,
    this.overflow,
    this.textScaleFactor,
    this.onTap,
    Key? key,
  })  : type = VzTextType.typePrimary,
        super(key: key);

  const VzText.typeSecondary({
    required this.data,
    this.style = TypeDeTextStyle.body2,
    this.maxlines = 1,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.isReadOnly = false,
    this.color,
    this.textStyleCustom,
    this.overflow,
    this.textScaleFactor,
    this.onTap,
    Key? key,
  })  : type = VzTextType.typeSecondary,
        super(key: key);

  const VzText.typeTertiary({
    required this.data,
    this.style = TypeDeTextStyle.body2,
    this.maxlines = 1,
    this.softWrap = true,
    this.textAlign = TextAlign.start,
    this.isReadOnly = false,
    this.color,
    this.textStyleCustom,
    this.overflow,
    this.textScaleFactor,
    this.onTap,
    Key? key,
  })  : type = VzTextType.typeTertiary,
        super(key: key);

  final String data;
  final int maxlines;
  final TextStyle? textStyleCustom;
  final TypeDeTextStyle style;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final double? textScaleFactor;
  final VzTextType type;
  final bool isReadOnly;
  final Function()? onTap;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    final colorText = color ?? ColorUtils.colorStyle(type);

    return isReadOnly
        ? Text(
            data,
            overflow: overflow,
            softWrap: softWrap,
            maxLines: maxlines,
            textAlign: textAlign,
            key: key,
            textScaleFactor: textScaleFactor,
            style: textStyleCustom ?? style.textStyle.copyWith(color: colorText),
          )
        : SelectableText(
            data,
            scrollPhysics: NeverScrollableScrollPhysics(),
            maxLines: maxlines,
            textAlign: textAlign,
            key: key,
            textWidthBasis: TextWidthBasis.parent,
            strutStyle: StrutStyle.fromTextStyle(textStyleCustom ??
                style.textStyle.copyWith(
                  color: colorText,
                )),
            onTap: onTap,
            textScaleFactor: textScaleFactor,
            style: textStyleCustom ??
                style.textStyle.copyWith(
                  color: colorText,
                ),
            toolbarOptions: const ToolbarOptions(
              copy: true,
              selectAll: true,
            ),
          );
  }
}
