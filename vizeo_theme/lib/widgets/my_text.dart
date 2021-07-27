part of '../vizeo_theme.dart';

class MyText extends Text {
  MyText({
    required String data,
    double fontSize: 18.0,
    Color color: Colors.black,
    FontWeight fontWeight: FontWeight.normal,
    FontStyle fontStyle: FontStyle.normal,
    Color colorShadow: Colors.transparent,
    TextOverflow overflow: TextOverflow.ellipsis,
    double textScaleFactor: 1,
    double height: 1,
    TextAlign alignement: TextAlign.left,
    int maxLines: 1,
  }) : super(
          data,
          textAlign: alignement,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
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
