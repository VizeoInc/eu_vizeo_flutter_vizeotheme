part of '../vizeo_theme.dart';

ThemeData vzThemeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: VzColor.backgroundPrimaryLight,
    focusColor: VzColor.backgroundTertiaryLight,
    buttonColor: VzColor.backgroundSecondaryLight,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: VzColor.backgroundPrimaryLight,
    fontFamily: myFontFamily,
    disabledColor: VzColor.transparent,
    hintColor: VzColor.textTertiaryLight,
    cardColor: VzColor.backgroundSecondaryLight,
    colorScheme: const ColorScheme(
      ///primary variant temporaire, secondaire background inverse
      primary: VzColor.redVizeo,
      primaryVariant: VzColor.redVizeoSoft,
      secondary: VzColor.backgroundSecondaryDark,
      secondaryVariant: VzColor.backgroundTertiaryDark,
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
