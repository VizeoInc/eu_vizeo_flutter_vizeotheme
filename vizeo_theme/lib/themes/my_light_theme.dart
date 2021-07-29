part of '../vizeo_theme.dart';

ThemeData themeLight(BuildContext context) {
  final typo = Typography.material2018(platform: Theme.of(context).platform);
  final textTheme = typo.black.copyWith(
    headline6: typo.black.headline6?.copyWith(
      color: Colors.green,
    ),
    bodyText2: typo.black.bodyText2?.copyWith(
      color: Colors.yellow,
    ),
    bodyText1: typo.black.bodyText1?.copyWith(
      color: Colors.blue,
    ),
  );

  return ThemeData(
    //primarySwatch: themeColor,
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: ColorVizeo.backgroundPrimaryLight,
    fontFamily: myFontFamily,

    ///splashColor: backgroundTertiaryDark.withAlpha(40),
    disabledColor: ColorVizeo.transparent,
    hintColor: ColorVizeo.textTertiaryLight,
    cardColor: ColorVizeo.backgroundSecondaryLight,

    ///textTheme: textTheme,
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
