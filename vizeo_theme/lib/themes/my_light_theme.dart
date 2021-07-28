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
    scaffoldBackgroundColor: backgroundPrimaryLight,
    fontFamily: myFontFamily,

    ///splashColor: backgroundTertiaryDark.withAlpha(40),
    disabledColor: transparent,
    hintColor: textTertiaryLight,
    cardColor: backgroundSecondaryLight,

    ///textTheme: textTheme,
    colorScheme: const ColorScheme(
      ///primary variant temporaire, secondaire background inverse
      primary: redVizeo,
      primaryVariant: redVizeoSoft,
      secondary: backgroundSecondaryDark,
      secondaryVariant: backgroundTertiaryDark,
      surface: backgroundPrimaryLight,
      background: backgroundPrimaryLight,
      error: redNegativeWarning,
      onPrimary: textOnRedVizeo,
      onSecondary: textSecondaryDark,
      onSurface: textPrimaryLight,
      onBackground: textPrimaryLight,
      onError: textOnRedVizeo,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: backgroundSecondaryLight,
      elevation: 0,
      textTheme: textTheme.copyWith(
        headline6: const TextStyle(
          color: textSecondaryLight,
          fontFamily: myFontFamily,
        ),
      ),
      iconTheme: const IconThemeData(color: textSecondaryLight),
      actionsIconTheme: const IconThemeData(
        color: textSecondaryLight,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: redVizeo,
      foregroundColor: textOnRedVizeo,
    ),
    dividerTheme: const DividerThemeData(
      color: backgroundPrimaryDark,
      thickness: 1,
    ),
  );
}

