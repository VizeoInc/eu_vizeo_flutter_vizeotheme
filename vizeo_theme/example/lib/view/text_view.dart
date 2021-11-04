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
            SizedBox(
              child: VzText.typePrimary(
                data: "Primary",
                isReadOnly: true,
              ),
            ),
            VzText.typePrimary(
              data: "Primary Custom",
              textStyleCustom: TextStyle(
                color: Colors.green,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              isReadOnly: true,
            ),
            VzText.typeSecondary(
              data: "Secondary",
              isReadOnly: true,
            ),
            VzText.typeSecondary(
              data: "Secondary Custom",
              textStyleCustom: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
              isReadOnly: true,
            ),
            VzText.typeTertiary(
              data: "Tertiary",
              isReadOnly: true,
            ),
            VzText.typeTertiary(
              data: "Tertiary Custom",
              textStyleCustom: TextStyle(
                color: Colors.red,
                fontSize: 8.0,
                fontStyle: FontStyle.italic,
              ),
              isReadOnly: true,
            ),
          ],
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            VzText.typePrimary(
              data: "Selectable Primary",
            ),
            VzText.typePrimary(
              data: "Selectable Primary Custom",
              textStyleCustom: TextStyle(
                color: Colors.green,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzText.typeSecondary(
              data: "Selectable Secondary",
            ),
            VzText.typeSecondary(
              data: "Selectable Secondary Custom",
              textStyleCustom: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            VzText.typeTertiary(
              data: "Selectable Tertiary",
            ),
            VzText.typeTertiary(
              data: "Selectable Tertiary Custom",
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
      ],
    );
  }
}
