part of '../vizeo_theme.dart';



class VzText extends StatefulWidget {
  final String data;
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
  final int maxLines;
  late final VzTextType _vzTextType;

  VzText.typePrimary({
    required this.data,
    this.height = 1,
    this.color,
    this.colorShadow = VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize = 24.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w800,
    this.align = TextAlign.left,
    this.textScaleFactor = 1,
    this.bold = false,
    this.maxLines = 1,
  }) {
    _vzTextType = VzTextType.typePrimary;
  }

  VzText.typeSecondary({
    required this.data,
    this.height = 1,
    this.color,
    this.colorShadow = VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize = 18.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w700,
    this.align = TextAlign.left,
    this.textScaleFactor = 1,
    this.bold = false,
    this.maxLines = 1,
  }) {
    _vzTextType = VzTextType.typeSecondary;
  }

  VzText.typeTertiary({
    required this.data,
    this.height = 1,
    this.color,
    this.colorShadow = VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize = 18.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.left,
    this.textScaleFactor = 1,
    this.bold = false,
    this.maxLines = 1,
  }) {
    _vzTextType = VzTextType.typeTertiary;
  }

  @override
  _VzTextState createState() => _VzTextState();
}

class _VzTextState extends State<VzText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      textAlign: widget.align,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      style: textStyle(),
    );
  }

  TextStyle textStyle() {
    TextStyle style;

    final textStylePrimary = TextStyle(
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
    );

    final textStyleSecondary = Theme.of(context).textTheme.headline6;
    final textStyleTerciary = Theme.of(context).textTheme.headline5;

    switch (widget._vzTextType) {
      case VzTextType.typePrimary:
        style = textStylePrimary;
        break;
      case VzTextType.typeSecondary:
        style = textStyleSecondary!;
        break;
      case VzTextType.typeTertiary:
        style = textStyleTerciary!;
        break;
      default:
        style = textStylePrimary;
    }

    return style;
  }
}
