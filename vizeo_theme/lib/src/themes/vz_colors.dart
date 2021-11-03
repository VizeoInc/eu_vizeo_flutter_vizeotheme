import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/themes/vz_dark_theme.dart';
import 'package:vizeo_theme/src/themes/vz_light_theme.dart';

GlobalKey<NavigatorState> vzThemeKey = GlobalKey<NavigatorState>();

MaterialColor createMaterialColor(Color color) {
  final strengths = [.05];
  final Map<int, Color> swatch = {};
  final int r = color.red;
  final int g = color.green;
  final int b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class VzColor {
  static const Color redVizeo = Color(0xFFF24C52);
  static const Color textOnRedVizeo = Color(0xFFFFFFFF);
  static const Color redError = Color(0xFFE26868);
  static const Color greenValidation = Color(0xFF5DC896);

  static const Color importanceHigh = Color(0xFFE94C1B);
  static const Color importanceMedium = Color(0xFFF2C230);
  static const Color importanceLow = Color(0xFF93C700);


  static const Color backgroundPrimaryDark = Color(0xFF101735);
  static const Color backgroundSecondaryDark = Color(0xFF1B2445);
  static const Color backgroundTertiaryDark = Color(0xFF31385A);

  static const Color accentDark = Color(0xFF676A83);

  static const Color textPrimaryDark = Color(0xFFEBEEF8);
  static const Color textSecondaryDark = Color(0xFFBCC0D3);
  static const Color textTertiaryDark = Color(0xFF979BB1);


  static const Color backgroundPrimaryLight = Color(0xFFEAEAEF);
  static const Color backgroundSecondaryLight = Color(0xFFF2F3F8);
  static const Color backgroundTertiaryLight = Color(0xFF989BB1);

  static const Color accentLight = Color(0xFF9FA5B9);

  static const Color textPrimaryLight = Color(0xFF16204E);
  static const Color textSecondaryLight = Color(0xFF485176);
  static const Color textTertiaryLight = Color(0xFF6F7592);

  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;


  // not really use old colors
  static const Color redVizeoSoft = Color(0xFFF16066);
  static const Color secondaryButton = Color(0xFF273464);
  static const Color secondaryButtonSoft = Color(0xFF374475);
  static const Color tertiaryButtonHovered = Color(0xFFF24C52);

  static Color backgroundPrimary({bool isReverse = false}) {
    if (isReverse) {
      if (Theme.of(vzThemeKey.currentContext!).brightness == Brightness.dark) {
        return vzThemeLight().colorScheme.background;
      } else if (Theme.of(vzThemeKey.currentContext!).brightness ==
          Brightness.light) {
        return vzThemeDark().colorScheme.background;
      }
    }
    return Theme.of(vzThemeKey.currentContext!).colorScheme.background;
  }

  static Color backgroundSecondary({bool isReverse = false}) {
    if (isReverse) {
      if (Theme.of(vzThemeKey.currentContext!).brightness == Brightness.dark) {
        return vzThemeLight().colorScheme.secondary;
      } else if (Theme.of(vzThemeKey.currentContext!).brightness ==
          Brightness.light) {
        return vzThemeDark().colorScheme.secondary;
      }
    }
    return Theme.of(vzThemeKey.currentContext!).colorScheme.secondary;
  }

  static Color backgroundTertiary({bool isReverse = false}) {
    return themUsed(isReverse).colorScheme.secondaryVariant;
  }

  static Color accentColor({bool isReverse = false}) {
    return themUsed(isReverse).accentColor;
  }

  static ThemeData themUsed(bool isReverse) {
    ThemeData themeUsed = Theme.of(vzThemeKey.currentContext!);

    if (isReverse) {
      themeUsed =
          Theme.of(vzThemeKey.currentContext!).brightness == Brightness.dark
              ? vzThemeLight()
              : vzThemeDark();
    }

    return themeUsed;
  }

  static Color? textPrimary({bool isReverse = false}) {
    return themUsed(isReverse).textTheme.bodyText1!.color;
  }

  static Color? textSecondary({bool isReverse = false}) {
    return themUsed(isReverse).textTheme.headline6!.color;
  }

  static Color? textTerciary({bool isReverse = false}) {
    return themUsed(isReverse).textTheme.headline5!.color;
  }

  static Color secondaryButtonColor({bool isReverse = false}) {
    if (isReverse) {
      return themUsed(isReverse).brightness == Brightness.dark
          ? textPrimaryLight
          : textSecondaryLight;
    } else {
      return themUsed(isReverse).brightness == Brightness.dark
          ? textSecondaryLight
          : textPrimaryLight;
    }
  }

  static Color tertiaryButtonColor({bool isReverse = false}) {
    if (isReverse) {
      return themUsed(isReverse).brightness == Brightness.dark
          ? textSecondaryLight
          : backgroundPrimaryDark;
    } else {
      return themUsed(isReverse).brightness == Brightness.dark
          ? backgroundPrimaryDark
          : textSecondaryLight;
    }
  }

  static Color contourButtonSecondary({bool isReverse = false}) {
    return themUsed(isReverse).brightness == Brightness.dark
        ? textTertiaryDark
        : textPrimaryLight;
  }
}
