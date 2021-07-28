part of '../vizeo_theme.dart';

class MyText extends SelectableText {
  MyText({
    required String data,
    double fontSize: 18.0,
    Color color: Colors.black,
    bool bold: false,
    FontStyle fontStyle: FontStyle.normal,
    Color colorShadow: Colors.transparent,
    double textScaleFactor: 1,
    double height: 1,
    TextAlign align: TextAlign.left,
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
            fontFamily: "DIN2014",
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
