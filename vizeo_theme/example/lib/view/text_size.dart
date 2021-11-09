import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class TextSize extends StatelessWidget {
  const TextSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            VzText.typePrimary(
              data: "H1",
              style: TypeDeTextStyle.h1,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "H2",
              style: TypeDeTextStyle.h2,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "H3",
              style: TypeDeTextStyle.h3,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "H4",
              style: TypeDeTextStyle.h4,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "H5",
              style: TypeDeTextStyle.h5,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "H6",
              style: TypeDeTextStyle.h6,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "Body1",
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "Body2",
              style: TypeDeTextStyle.body2,
              isReadOnly: true,
            ),
            VzText.typePrimary(
              data: "Body3",
              style: TypeDeTextStyle.body3,
              isReadOnly: true,
            ),
          ],
        ),
      ],
    );
  }
}
