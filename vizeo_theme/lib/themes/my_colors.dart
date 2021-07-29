part of '../vizeo_theme.dart';

const redVizeo = Color(0xFFF24C52);
const redVizeoSoft = Color(0xFFF16066);
const secondaryButton = Color(0xFF273464);
const secondaryButtonSoft = Color(0xFF374475);
const textOnRedVizeo = Color(0xFFECEFFF);

const accentDark = Color(0xFF666B84);

const backgroundPrimaryDark = Color(0xFF101735);
const backgroundSecondaryDark = Color(0xFF1D2445);
const backgroundTertiaryDark = Color(0xFF30395A);

const textPrimaryDark = Color(0xFFECEFFF);
const textSecondaryDark = Color(0xFFBBBFD2);
const textTertiaryDark = Color(0xFF979BB1);

const accentLight = Color(0xFFA1A5B9);

const backgroundPrimaryLight = Color(0xFFEDEEF3);
const backgroundSecondaryLight = Color(0xFFF3F4F8);
const backgroundTertiaryLight = Color(0xFFF9FAFD);

const textPrimaryLight = Color(0xFF16204E);
const textSecondaryLight = Color(0xFF495175);
const textTertiaryLight = Color(0xFF6F7592);

const redNegativeWarning = Color(0xFFCE464B);
const greenValidate = Color(0xFF2CA099);

const transparent = Colors.transparent;
const white = Colors.white;

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
