part of '../vizeo_theme.dart';

class VzTextSelectable extends StatefulWidget {
  final String data;
  final Function()? onTap;
  final double height;
  final Color? color;
  final Color colorShadow;
  final Offset offset;
  final double blurRadius;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextAlign align;
  final double textScaleFactor;
  final bool bold;
  final bool enableInteractiveSelection;
  final int maxLines;

  const VzTextSelectable.typePrimary({
    required this.data,
    this.onTap,
    this.height: 1,
    this.color,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 4.0,
    this.fontSize: 18.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w800,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.bold: false,
    this.maxLines: 1,
  });

  const VzTextSelectable.typePrimarySelectable({
    required this.data,
    this.onTap,
    this.height: 1,
    this.color,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 4.0,
    this.fontSize: 18.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w800,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.bold: false,
    this.maxLines: 1,
  });

  const VzTextSelectable.typeSecondary({
    required this.data,
    this.onTap,
    this.height: 1,
    this.color,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 4.0,
    this.fontSize: 18.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w700,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.bold: false,
    this.maxLines: 1,
  });

  const VzTextSelectable.typeTertiary({
    required this.data,
    this.onTap,
    this.height: 1,
    this.color,
    this.enableInteractiveSelection = true,
    this.colorShadow: VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 4.0,
    this.fontSize: 18.0,
    this.fontStyle: FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.align: TextAlign.left,
    this.textScaleFactor: 1,
    this.bold: false,
    this.maxLines: 1,
  });

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
        color: widget.color,
        fontWeight: widget.bold ? FontWeight.w800 : FontWeight.w400,
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
