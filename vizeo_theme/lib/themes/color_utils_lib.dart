part of '../vizeo_theme.dart';

class ColorUtils {
  static Color colorStyle(BuildContext context, VzTextType vzTextType) {
    Color? color;

    print("Enter Switch");
    switch (vzTextType) {
      case VzTextType.typePrimary:
        print("Primaire");
        color = Theme.of(context).textTheme.bodyText1!.color;
        break;
      case VzTextType.typeSecondary:
        print("Secondaire");
        color = Theme.of(context).textTheme.headline6!.color;
        break;
      case VzTextType.typeTertiary:
        print("Terciaire");
        color = Theme.of(context).textTheme.headline5!.color;
        break;
      default:
        color = Theme.of(context).textTheme.bodyText1!.color;
    }

    return color!;
  }
}
