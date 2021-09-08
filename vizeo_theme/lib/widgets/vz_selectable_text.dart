import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/color_utils_lib.dart';

class VzTextSelectable extends SelectableText {
  String data;
  final int maxlines;
  final bool enableInteractiveSelection;
  final Function()? onTap;
  final Color? color;

  VzTextSelectable.typePrimary({
    required this.data,
    TypeDeTextStyle style = TypeDeTextStyle.body1,
    this.onTap,
    this.maxlines = 1,
    this.enableInteractiveSelection = true,
    this.color,
  }) : super(
          data,
          maxLines: maxlines,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          style: style.textStyle.copyWith(
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
  }) : super(
          data,
          maxLines: maxlines,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          style: style.textStyle.copyWith(
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
  }) : super(
          data,
          maxLines: maxlines,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          style: style.textStyle.copyWith(
            color: color ?? ColorUtils.colorStyle(VzTextType.typeTertiary),
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        );
}
