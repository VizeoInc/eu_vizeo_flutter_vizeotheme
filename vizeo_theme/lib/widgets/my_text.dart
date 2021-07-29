part of '../vizeo_theme.dart';

class MyText extends SelectableText {
  MyText({
    required String data,
    double height: 1,
    Color color: Colors.black,
    Color colorShadow: Colors.transparent,
    double fontSize: 18.0,
    FontStyle fontStyle: FontStyle.normal,
    TextAlign align: TextAlign.left,
    double textScaleFactor: 1,
    bool bold: false,
    int maxLines: 1,
  }) : super(
          data,
          textAlign: align,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontWeight: bold ? FontWeight.bold : FontWeight.w400,
            fontSize: fontSize,
            fontStyle: fontStyle,
            height: height,
            fontFamily: myFontFamily,
            shadows: [
              Shadow(
                color: colorShadow,
                offset: const Offset(1, 1),
                blurRadius: 4.0,
              ),
            ],
          ),
        );
}
