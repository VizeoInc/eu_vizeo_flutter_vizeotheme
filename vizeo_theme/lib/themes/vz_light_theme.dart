import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/constants_value.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/vz_strings.dart';

ThemeData vzThemeLight() {
  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: VzColor.backgroundPrimaryLight,
    focusColor: VzColor.backgroundTertiaryLight,
    buttonColor: VzColor.backgroundSecondaryLight,
    accentColor: VzColor.accentLight,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: VzColor.backgroundPrimaryLight,
    fontFamily: myFontFamily,
    disabledColor: VzColor.transparent,
    hintColor: VzColor.textTertiaryLight,
    buttonTheme: ButtonThemeData(
      buttonColor: VzColor.secondaryButton,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
    ),
    cardTheme: CardTheme(
      color: VzColor.backgroundSecondaryLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return VzColor.backgroundPrimaryDark;
      }),
      checkColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return VzColor.backgroundPrimaryLight;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(width: 0.5),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: VzColor.textTertiaryLight,
        fontFamily: myFontFamily,
        fontSize: 18.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ConstantValue.borderRadiusTextForm),
        ),
        borderSide: BorderSide(
          color: VzColor.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ConstantValue.borderRadiusTextForm),
        ),
        borderSide: BorderSide(
          color: VzColor.accentLight,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ConstantValue.borderRadiusTextForm),
        ),
        borderSide: BorderSide(
          color: VzColor.redVizeo,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ConstantValue.borderRadiusTextForm),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ConstantValue.borderRadiusTextForm),
        ),
        borderSide: BorderSide(
          color: VzColor.redVizeo,
          width: 2.0,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      errorStyle: TextStyle(
        color: VzColor.redVizeo,
      ),
    ),
    colorScheme: const ColorScheme(
      ///primary variant temporaire, secondaire background inverse
      primary: VzColor.redVizeo,
      primaryVariant: VzColor.redVizeoSoft,
      secondary: VzColor.backgroundSecondaryLight,
      secondaryVariant: VzColor.backgroundTertiaryLight,
      surface: VzColor.backgroundPrimaryLight,
      background: VzColor.backgroundPrimaryLight,
      error: VzColor.redNegativeWarning,
      onPrimary: VzColor.textOnRedVizeo,
      onSecondary: VzColor.textSecondaryDark,
      onSurface: VzColor.textPrimaryLight,
      onBackground: VzColor.textPrimaryLight,
      onError: VzColor.textOnRedVizeo,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      color: VzColor.backgroundSecondaryLight,
      elevation: 0,
      iconTheme: IconThemeData(color: VzColor.textSecondaryLight),
      actionsIconTheme: IconThemeData(
        color: VzColor.textSecondaryLight,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: VzColor.redVizeo,
      foregroundColor: VzColor.textOnRedVizeo,
    ),
    dividerTheme: const DividerThemeData(
      color: VzColor.backgroundPrimaryDark,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textPrimaryLight,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textPrimaryLight,
        fontStyle: FontStyle.normal,
      ),
      // is for secondary button
      headline6: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textSecondaryLight,
        fontStyle: FontStyle.normal,
      ),
      // is for terciary button
      headline5: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textTertiaryLight,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
