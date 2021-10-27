import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class TextView extends StatelessWidget {
  const TextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            VzText.typePrimary(data: "Primary"),
            VzText.typePrimary(
              data: "Primary Custom",
              textStyleCustom: TextStyle(
                color: Colors.green,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzText.typeSecondary(data: "Secondary"),
            VzText.typeSecondary(
              data: "Secondary Custom",
              textStyleCustom: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzText.typeTertiary(data: "Tertiary"),
            VzText.typeTertiary(
              data: "Tertiary Custom",
              textStyleCustom: TextStyle(
                color: Colors.red,
                fontSize: 8.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            VzText.typePrimary(
              data: "H1",
              style: TypeDeTextStyle.h1,
            ),
            VzText.typePrimary(
              data: "H2",
              style: TypeDeTextStyle.h2,
            ),
            VzText.typePrimary(
              data: "H3",
              style: TypeDeTextStyle.h3,
            ),
            VzText.typePrimary(
              data: "H4",
              style: TypeDeTextStyle.h4,
            ),
            VzText.typePrimary(
              data: "H5",
              style: TypeDeTextStyle.h5,
            ),
            VzText.typePrimary(
              data: "H6",
              style: TypeDeTextStyle.h6,
            ),
            VzText.typePrimary(
              data: "Body1",
            ),
            VzText.typePrimary(
              data: "Body2",
              style: TypeDeTextStyle.body2,
            ),
            VzText.typePrimary(
              data: "Body3",
              style: TypeDeTextStyle.body3,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VzTextSelectable.typePrimary(data: "Selectable Primary"),
            VzTextSelectable.typePrimary(
              data: "Selectable Primary Custom",
              textStyleCustom: const TextStyle(
                color: Colors.green,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzTextSelectable.typeSecondary(data: "Selectable Secondary"),
            VzTextSelectable.typeSecondary(
              data: "Selectable Secondary Custom",
              textStyleCustom: const TextStyle(
                color: Colors.yellowAccent,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzTextSelectable.typeTertiary(data: "Selectable Tertiary"),
            VzTextSelectable.typeTertiary(
              data: "Selectable Tertiary Custom",
              textStyleCustom: const TextStyle(
                color: Colors.red,
                fontSize: 8.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VzTextSelectable.typePrimary(data: "H1", style: TypeDeTextStyle.h1),
            VzTextSelectable.typePrimary(data: "H2", style: TypeDeTextStyle.h2),
            VzTextSelectable.typePrimary(data: "H3", style: TypeDeTextStyle.h3),
            VzTextSelectable.typePrimary(data: "H4", style: TypeDeTextStyle.h4),
            VzTextSelectable.typePrimary(data: "H5", style: TypeDeTextStyle.h5),
            VzTextSelectable.typePrimary(data: "H6", style: TypeDeTextStyle.h6),
            VzTextSelectable.typePrimary(data: "Body1"),
            VzTextSelectable.typePrimary(
                data: "Body2", style: TypeDeTextStyle.body2),
            VzTextSelectable.typePrimary(
                data: "Body3", style: TypeDeTextStyle.body3),
          ],
        ),
      ],
    );
  }
}
