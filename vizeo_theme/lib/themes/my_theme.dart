part of '../vizeo_theme.dart';

const redVizeo = Color(0xFFF24C52);
const redVizeoSoft = Color(0xFFF16066);
const secondaryButton = Color(0xFF273464);
const secondaryButtonSoft = Color(0xFF374475);
const textOnRed = Color(0xFFECEFFF);

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

const myFontFamily = 'DIN2014';

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: backgroundPrimaryLight,
      accentColorBrightness: Brightness.dark,

      primaryColor: redVizeo,
      primaryColorDark: Colors.pink,
      primaryColorLight: Colors.green,
      primaryColorBrightness: Brightness.dark,
      textTheme: const TextTheme(bodyText1: TextStyle(color: greenValidate)),
      buttonColor: redVizeo,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: redVizeoSoft,
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: backgroundPrimaryDark,

      // textTheme: base.textTheme.copyWith(
      //     title: base.textTheme.title.copyWith(color: TextColor),
      //     body1: base.textTheme.body1.copyWith(color: TextColor),
      //     body2: base.textTheme.body2.copyWith(color: TextColor)
      // ),
    );
  }
}
