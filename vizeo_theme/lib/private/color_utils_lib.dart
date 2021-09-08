import 'package:flutter/material.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';
import 'enum.dart';

class ColorUtils {
  static Color colorStyle(VzTextType vzTextType) {
    Color? color;

    switch (vzTextType) {
      case VzTextType.typePrimary:
        color = VzColor.textPrimary();
        break;
      case VzTextType.typeSecondary:
        color = VzColor.textSecondary();
        break;
      case VzTextType.typeTertiary:
        color = VzColor.textTerciary();
        break;
      default:
        color = VzColor.textPrimary();
    }

    return color!;
  }
}
