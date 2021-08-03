part of '../vizeo_theme.dart';

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
    colorScheme: const ColorScheme(
      primary: VzColor.redVizeo,
      primaryVariant: VzColor.redVizeoSoft,
      secondary: VzColor.backgroundSecondaryDark,
      secondaryVariant: VzColor.backgroundTertiaryDark,
      surface: VzColor.backgroundPrimaryLight,
      background: VzColor.backgroundPrimaryLight,
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
