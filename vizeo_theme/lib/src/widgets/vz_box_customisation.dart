import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/constants_value.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';

class VzBox {
  static BoxDecoration vzBoxDecoration({
    Color colorBorder = VzColor.transparent,
    BorderStyle style = BorderStyle.none,
    double width = 1.0,
    Color? colorBackground,
  }) {
    return BoxDecoration(
      border: Border.all(
        color: colorBorder,
        style: style,
        width: width,
      ),
      borderRadius: BorderRadius.circular(
        ConstantValue.borderRadiusTextForm,
      ),
      color: colorBackground ?? VzColor.backgroundPrimaryLight,
      boxShadow: [
        vzBoxShadow(),
      ],
    );
  }

  static BoxShadow vzBoxShadow() {
    return BoxShadow(
      color: VzColor.textPrimary()!.withOpacity(0.15),
      blurRadius: 5,
      offset: const Offset(0, 3), // changes position of shadow
    );
  }
}
