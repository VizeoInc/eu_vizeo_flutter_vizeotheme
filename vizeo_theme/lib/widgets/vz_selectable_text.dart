import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/color_utils_lib.dart';

class VzTextSelectable extends StatefulWidget {
  final String data;
  final Function()? onTap;
  final double height;
  final Color colorShadow;
  final Offset offset;
  final double blurRadius;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextAlign align;
  final double textScaleFactor;
  final bool enableInteractiveSelection;
  final int maxLines;
  final Color? color;
  late final VzTextType _vzTextType;

  VzTextSelectable.typePrimary({
    required this.data,
    this.onTap,
    this.height: 1,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize: 24.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w800,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.maxLines: 1,
    this.color,
  }) {
    _vzTextType = VzTextType.typePrimary;
  }

  VzTextSelectable.typeSecondary({
    required this.data,
    this.onTap,
    this.height: 1,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize: 18.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w700,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.maxLines: 1,
    this.color,
  }) {
    _vzTextType = VzTextType.typeSecondary;
  }

  VzTextSelectable.typeTertiary({
    required this.data,
    this.onTap,
    this.height: 1,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize: 18.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.maxLines: 1,
    this.color,
  }) {
    _vzTextType = VzTextType.typeTertiary;
  }

  @override
  _VzTextSeletableState createState() => _VzTextSeletableState();
}

class _VzTextSeletableState extends State<VzTextSelectable> {
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      widget.data,
      textAlign: widget.align,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      onTap: widget.onTap,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        selectAll: true,
      ),
      style: TextStyle(
        color: widget.color ?? ColorUtils.colorStyle(widget._vzTextType),
        fontWeight: widget.fontWeight,
        fontSize: widget.fontSize,
        fontStyle: widget.fontStyle,
        height: widget.height,
        shadows: [
          Shadow(
            color: widget.colorShadow,
            offset: widget.offset,
            blurRadius: widget.blurRadius,
          ),
        ],
      ),
    );
  }
}

class VzTextSelectableV2 extends SelectableText {
  String data;
  final int maxlines;
  final bool enableInteractiveSelection;
  final Function()? onTap;
  final Color? color;

  VzTextSelectableV2.typePrimary({
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

  VzTextSelectableV2.typeSecondary({
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

  VzTextSelectableV2.typeTertiary({
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
