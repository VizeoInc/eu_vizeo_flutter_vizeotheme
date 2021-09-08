import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/color_utils_lib.dart';

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
  final Color? color;
  late final VzTextType _vzTextType;

  VzText.typePrimary(
      {required this.data,
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
      this.color}) {
    _vzTextType = VzTextType.typePrimary;
  }

  VzText.typeSecondary(
      {required this.data,
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
      this.color}) {
    _vzTextType = VzTextType.typeSecondary;
  }

  VzText.typeTertiary(
      {required this.data,
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
      this.color}) {
    _vzTextType = VzTextType.typeTertiary;
  }

  @override
  _VzTextState createState() => _VzTextState();
}

class _VzTextState extends State<VzText> {

  @override
  Widget build(BuildContext context) {
    var colorTheme = widget.color ?? ColorUtils.colorStyle(widget._vzTextType);
    return Text(
      widget.data,
      textAlign: widget.align,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      style: TextStyle(
        color: colorTheme,
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



// enum TypeDeStyle { H1, H2, H3, Body1, Body2 }

// extension TypeDeStyleExt on TypeDeStyle {
//   TextStyle get textStyle {
//     switch (this) {
//       case TypeDeStyle.H1:
//         return TextStyle(
//           fontSize: 55,
//           fontWeight: FontWeight.w700,
          
//         );
//     }
//     return TextStyle();
//   }

//   TextStyle get textStyleFromColor {
//       switch (this) {
//       case TypeDeStyle.H1:
//         return const TextStyle(
//           fontSize: 55,
//           fontWeight: FontWeight.w700,
//         );
//         case TypeDeStyle.H2:
//           return const TextStyle(
//           fontSize: 55,
//           fontWeight: FontWeight.w700,
//         );
//         case TypeDeStyle.H3:
//          return const TextStyle(
//           fontSize: 55,
//           fontWeight: FontWeight.w700,
//         );
//         case TypeDeStyle.Body1:
//           return const TextStyle(
//           fontSize: 55,
//           fontWeight: FontWeight.w700,
//         );
//         case TypeDeStyle.Body2:
//           return const TextStyle(
//           fontSize: 55,
//           fontWeight: FontWeight.w700,
//         );
//           default:
//           return const TextStyle();
//     }

//   }
// }

// class VzTextBG extends StatefulWidget {
//   //  late String data;
// /*
//   VzTextBG(this.data) : super(data) {
//     this.maxLines = 10;
//   }
//   */
//   late String data;
//   late int maxline;
//   late TypeDeStyle type;

//   VzTextBG.fromCeQuejeVeux(this.data, this.maxline,
//       {this.type = TypeDeStyle.H1})
//       : super() {

       
//     //_init();
//   }
// }