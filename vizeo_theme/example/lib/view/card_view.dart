import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(50),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: VzText.typePrimary(data: "card border true"),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(50),
              borderOnForeground: false,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: VzText.typePrimary(data: "card border false"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
