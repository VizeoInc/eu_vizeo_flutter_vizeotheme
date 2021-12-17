import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class TextSize extends StatelessWidget {
  const TextSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 25.0,
          runSpacing: 25.0,
          children: [
            ...[
              TypeDeTextStyle.h1,
              TypeDeTextStyle.h2,
              TypeDeTextStyle.h3,
              TypeDeTextStyle.h4,
              TypeDeTextStyle.h5,
              TypeDeTextStyle.h6,
              TypeDeTextStyle.body1,
              TypeDeTextStyle.body2,
              TypeDeTextStyle.body3,
            ].map(
              (style) => _StyleVzTextPrimary(
                style: style,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StyleVzTextPrimary extends StatelessWidget {
  _StyleVzTextPrimary({required this.style, Key? key}) : super(key: key);
  final TypeDeTextStyle style;
  @override
  Widget build(BuildContext context) {
    final fontWeight =
        style.textStyle.fontWeight == FontWeight.w700 ? "bold" : "regular";
    if (style.textStyle.fontWeight == FontWeight.w700) {}
    return VzText.typePrimary(
      data: "${style.name}/$fontWeight/${style.textStyle.fontSize}px",
      style: style,
      isReadOnly: true,
    );
  }
}
