import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/enum.dart';
import 'package:vizeo_theme/src/private/color_utils_lib.dart';

class VzTextSelectable extends SelectableText {
  final String data;
  final int maxlines;
  final bool enableInteractiveSelection;
  final Function()? onTap;
  final TextStyle? textStyleCustom;
  final Color? color;

  VzTextSelectable.typePrimary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.onTap,
    this.maxlines = 1,
    this.enableInteractiveSelection = true,
    this.color,
    this.textStyleCustom,
  }) : super(
          data,
          maxLines: maxlines,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          style: textStyleCustom ?? style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typePrimary),
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        );

  VzTextSelectable.typeSecondary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.onTap,
    this.maxlines = 1,
    this.enableInteractiveSelection = true,
    this.color,
    this.textStyleCustom,
  }) : super(
          data,
          maxLines: maxlines,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          style: textStyleCustom ?? style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typeSecondary),
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        );

  VzTextSelectable.typeTertiary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.onTap,
    this.maxlines = 1,
    this.enableInteractiveSelection = true,
    this.color,
    this.textStyleCustom,
  }) : super(
          data,
          maxLines: maxlines,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          style: textStyleCustom ?? style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typeTertiary),
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        );
}
