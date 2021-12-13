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
            VzText.typePrimary(
              data: "Primary",
              isReadOnly: true,
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
      ],
    );
  }
}
