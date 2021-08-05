import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/constants_value.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/vz_strings.dart';

ThemeData vzThemeDark(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    backgroundColor: VzColor.backgroundPrimaryDark,
    focusColor: VzColor.backgroundTertiaryDark,
    buttonColor: VzColor.backgroundSecondaryDark,
    fontFamily: myFontFamily,
    accentColor: VzColor.accentDark,
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: VzColor.backgroundPrimaryDark,
    hintColor: VzColor.textTertiaryDark,
    buttonTheme: ButtonThemeData(
      buttonColor: VzColor.secondaryButton,
      hoverColor: VzColor.secondaryButtonSoft,
      focusColor: VzColor.secondaryButtonSoft,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
    ),
    cardTheme: CardTheme(
      color: VzColor.backgroundSecondaryDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return VzColor.backgroundPrimaryLight;
      }),
      checkColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return VzColor.backgroundPrimaryDark;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(width: 0.5),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: VzColor.textTertiaryDark,
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
          color: VzColor.accentDark,
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
      primary: VzColor.redVizeo,
      primaryVariant: VzColor.redVizeoSoft,
      secondary: VzColor.backgroundSecondaryDark,
      secondaryVariant: VzColor.backgroundTertiaryDark,
      surface: VzColor.backgroundPrimaryLight,
      background: VzColor.backgroundPrimaryDark,
      error: VzColor.redNegativeWarning,
      onPrimary: VzColor.textOnRedVizeo,
      onSecondary: VzColor.textSecondaryLight,
      onSurface: VzColor.textPrimaryDark,
      onBackground: VzColor.textPrimaryDark,
      onError: VzColor.textOnRedVizeo,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.dark,
      color: VzColor.backgroundSecondaryDark,
      elevation: 0,
      iconTheme: IconThemeData(color: VzColor.textSecondaryDark),
      actionsIconTheme: IconThemeData(
        color: VzColor.textSecondaryDark,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: VzColor.redVizeo,
      foregroundColor: VzColor.textOnRedVizeo,
    ),
    dividerTheme: const DividerThemeData(
      color: VzColor.backgroundSecondaryLight,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textPrimaryDark,
        fontStyle: FontStyle.normal,
      ),
      // is for secondary button
      headline6: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textSecondaryDark,
        fontStyle: FontStyle.normal,
      ),
      // is for terciary button
      headline5: TextStyle(
        fontFamily: myFontFamily,
        color: VzColor.textTertiaryDark,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
