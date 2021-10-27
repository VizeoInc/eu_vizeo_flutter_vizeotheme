import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class ButtonContourView extends StatelessWidget {
  const ButtonContourView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzContourButton.typePrimary(
                title: "PRIMARY",
                onPressed: () => debugPrint("PRIMARY"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzContourButton.typeSecondary(
                title: "SECONDARY",
                onPressed: () => debugPrint("SECONDARY"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzContourButton.typeSmall(
                title: "SMALL",
                onPressed: () => debugPrint("SMALL"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzContourButton.typeSmall(
                title: "SMALL CUSTOM",
                onPressed: () => debugPrint("SMALL"),
                textColor: Colors.amber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
