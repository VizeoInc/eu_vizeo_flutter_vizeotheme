import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class ColorView extends StatelessWidget {
  const ColorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 25.0,
          runSpacing: 25.0,
          children: [
            ...[
              VzColor.accentDark,
              VzColor.accentLight,
              VzColor.backgroundPrimaryDark,
              VzColor.backgroundPrimaryLight,
              VzColor.backgroundSecondaryDark,
              VzColor.backgroundSecondaryLight,
              VzColor.backgroundTertiaryDark,
              VzColor.backgroundTertiaryLight,
              VzColor.greenValidation,
              VzColor.redError,
              VzColor.redVizeo,
              VzColor.redVizeoSoft,
              VzColor.secondaryButton,
              VzColor.secondaryButtonSoft,
              VzColor.tertiaryButtonHovered,
              VzColor.textOnRedVizeo,
              VzColor.textPrimaryDark,
              VzColor.textPrimaryLight,
              VzColor.textSecondaryDark,
              VzColor.textSecondaryLight,
              VzColor.textTertiaryDark,
              VzColor.textTertiaryLight,
              VzColor.transparent,
              VzColor.white,
            ].map((color) => _ContainerColor(color: color)),
          ],
        ),
      ],
    );
  }
}

class _ContainerColor extends StatelessWidget {
  const _ContainerColor({required this.color, Key? key}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: VzBox.vzBoxDecoration(colorBackground: color),
    );
  }
}
