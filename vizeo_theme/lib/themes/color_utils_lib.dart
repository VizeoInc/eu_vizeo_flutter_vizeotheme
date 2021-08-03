part of '../vizeo_theme.dart';

class ColorUtils {
  static Color colorStyle(BuildContext context,VzTextType vzTextType) {
    Color? color;

    switch (vzTextType) {
      case VzTextType.typePrimary:
        color = Theme.of(context).textTheme.bodyText1!.color;
        break;
      case VzTextType.typeSecondary:
        color = Theme.of(context).textTheme.headline6!.color;
        break;
      case VzTextType.typeTertiary:
        color = Theme.of(context).textTheme.headline5!.color;
        break;
      default:
        color = Theme.of(context).textTheme.bodyText1!.color;
    }

    return color!;
  }
}