part of '../vizeo_theme.dart';

MaterialColor createMaterialColor(Color color) {
  final strengths = [.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

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

class ColorVizeo {
  static const Color redVizeo = Color(0xFFF24C52);
  static const Color redVizeoSoft = Color(0xFFF16066);
  static const Color secondaryButton = Color(0xFF273464);
  static const Color secondaryButtonSoft = Color(0xFF374475);
  static const Color textOnRedVizeo = Color(0xFFECEFFF);

  static const Color accentDark = Color(0xFF666B84);

  static const Color backgroundPrimaryDark = Color(0xFF101735);
  static const Color backgroundSecondaryDark = Color(0xFF1D2445);
  static const Color backgroundTertiaryDark = Color(0xFF30395A);

  static const Color textPrimaryDark = Color(0xFFECEFFF);
  static const Color textSecondaryDark = Color(0xFFBBBFD2);
  static const Color textTertiaryDark = Color(0xFF979BB1);

  static const Color accentLight = Color(0xFFA1A5B9);

  static const Color backgroundPrimaryLight = Color(0xFFEDEEF3);
  static const Color backgroundSecondaryLight = Color(0xFFF3F4F8);
  static const Color backgroundTertiaryLight = Color(0xFFF9FAFD);

  static const Color textPrimaryLight = Color(0xFF16204E);
  static const Color textSecondaryLight = Color(0xFF495175);
  static const Color textTertiaryLight = Color(0xFF6F7592);

  static const Color redNegativeWarning = Color(0xFFCE464B);
  static const Color greenValidate = Color(0xFF2CA099);

  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
}
