part of '../vizeo_theme.dart';


ThemeData themeDark(BuildContext context) {
  final typo = Typography.material2018(platform: Theme.of(context).platform);
  final textTheme = typo.white;

  return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: backgroundPrimaryDark,
      fontFamily: myFontFamily,
      accentColor: accentDark,
      primaryColorBrightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundPrimaryDark,
      cardColor: backgroundSecondaryDark,
      hintColor: textTertiaryDark,
      colorScheme: const ColorScheme(
        primary: redVizeo,
        primaryVariant: redVizeoSoft,
        secondary: backgroundSecondaryLight,
        secondaryVariant: backgroundTertiaryLight,
        surface: backgroundPrimaryLight,
        background: backgroundPrimaryLight,
        error: redNegativeWarning,
        onPrimary: textOnRedVizeo,
        onSecondary: textSecondaryLight,
        onSurface: textPrimaryDark,
        onBackground: textPrimaryDark,
        onError: textOnRedVizeo,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: backgroundSecondaryDark,
        elevation: 0,
        textTheme: textTheme.copyWith(
          headline6: const TextStyle(
            color: textSecondaryDark,
            fontFamily: myFontFamily,
          ),
        ),
        iconTheme: const IconThemeData(color: textSecondaryDark),
        actionsIconTheme: const IconThemeData(
          color: textSecondaryDark,
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: redVizeo,
        foregroundColor: textOnRedVizeo,
      ),
      dividerTheme: const DividerThemeData(
        color: backgroundSecondaryLight,
        thickness: 1,
      ));
}
