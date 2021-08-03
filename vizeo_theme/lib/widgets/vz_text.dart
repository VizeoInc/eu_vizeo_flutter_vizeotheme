part of '../vizeo_theme.dart';

class VzText extends StatefulWidget {
  final String data;
  final double height;
  final Color colorShadow;
  final Offset offset;
  final double blurRadius;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextAlign align;
  final double textScaleFactor;
  final int maxLines;
  late final VzTextType _vzTextType;

  VzText.typePrimary({
    required this.data,
    this.height = 1,
    this.colorShadow = VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize = 24.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w800,
    this.align = TextAlign.left,
    this.textScaleFactor = 1,
    this.maxLines = 1,
  }) {
    _vzTextType = VzTextType.typePrimary;
  }

  VzText.typeSecondary({
    required this.data,
    this.height = 1,
    this.colorShadow = VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize = 18.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w700,
    this.align = TextAlign.left,
    this.textScaleFactor = 1,
    this.maxLines = 1,
  }) {
    _vzTextType = VzTextType.typeSecondary;
  }

  VzText.typeTertiary({
    required this.data,
    this.height = 1,
    this.colorShadow = VzColor.transparent,
    this.offset = const Offset(1, 1),
    this.blurRadius = 0.0,
    this.fontSize = 16.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.left,
    this.textScaleFactor = 1,
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
      style: TextStyle(
        color: colorStyle(),
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

  Color colorStyle() {
    Color? color;

    switch (widget._vzTextType) {
      case VzTextType.typePrimary:
        color = Theme.of(context).textTheme.bodyText1!.color;
        break;
      case VzTextType.typeSecondary:
        color = Theme.of(context).textTheme.headline6!.color;
        break;
      case VzTextType.typeTertiary:
        color = Theme.of(context).textTheme.headline5!.color;
        break;
      default:
        color = Theme.of(context).textTheme.bodyText1!.color;
    }

    return color!;
  }
}
