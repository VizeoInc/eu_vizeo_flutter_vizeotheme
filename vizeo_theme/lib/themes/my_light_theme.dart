part of '../vizeo_theme.dart';

ThemeData themeLight(BuildContext context) {
  final typo = Typography.material2018(platform: Theme.of(context).platform);
  final textTheme = typo.black.copyWith(
    headline6: typo.black.headline6?.copyWith(
      color: Colors.green,
    ),
    bodyText2: typo.black.bodyText2?.copyWith(
      color: ColorVizeo.textPrimaryLight,
      fontWeight: FontWeight.w400,
      fontFamily: myFontFamily,
      fontSize: 18,
    ),
    bodyText1: typo.black.bodyText1?.copyWith(
      color: ColorVizeo.textPrimaryLight,
      fontWeight: FontWeight.w400,
      fontFamily: myFontFamily,
      fontSize: 18,
    ),
  );

  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: ColorVizeo.backgroundPrimaryLight,
    focusColor: ColorVizeo.backgroundTertiaryLight,
    buttonColor: ColorVizeo.backgroundSecondaryLight,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: ColorVizeo.backgroundPrimaryLight,
    fontFamily: myFontFamily,
    disabledColor: ColorVizeo.transparent,
    hintColor: ColorVizeo.textTertiaryLight,
    cardColor: ColorVizeo.backgroundSecondaryLight,
    colorScheme: const ColorScheme(
      ///primary variant temporaire, secondaire background inverse
      primary: ColorVizeo.redVizeo,
      primaryVariant: ColorVizeo.redVizeoSoft,
      secondary: ColorVizeo.backgroundSecondaryDark,
      secondaryVariant: ColorVizeo.backgroundTertiaryDark,
      surface: ColorVizeo.backgroundPrimaryLight,
      background: ColorVizeo.backgroundPrimaryLight,
      error: ColorVizeo.redNegativeWarning,
      onPrimary: ColorVizeo.textOnRedVizeo,
      onSecondary: ColorVizeo.textSecondaryDark,
      onSurface: ColorVizeo.textPrimaryLight,
      onBackground: ColorVizeo.textPrimaryLight,
      onError: ColorVizeo.textOnRedVizeo,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: ColorVizeo.backgroundSecondaryLight,
      elevation: 0,
      textTheme: textTheme.copyWith(
        headline6: const TextStyle(
          color: ColorVizeo.textSecondaryLight,
          fontFamily: myFontFamily,
        ),
      ),
      iconTheme: const IconThemeData(color: ColorVizeo.textSecondaryLight),
      actionsIconTheme: const IconThemeData(
        color: ColorVizeo.textSecondaryLight,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorVizeo.redVizeo,
      foregroundColor: ColorVizeo.textOnRedVizeo,
    ),
    dividerTheme: const DividerThemeData(
      color: ColorVizeo.backgroundPrimaryDark,
      thickness: 1,
    ),
  );
}
