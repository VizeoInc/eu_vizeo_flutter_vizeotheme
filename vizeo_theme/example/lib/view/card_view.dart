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
          children: const [
            Card(
              margin:  EdgeInsets.all(50),
              child: Padding(
                padding:  EdgeInsets.all(32.0),
                child: VzText.typePrimary(data: "card border true"),
              ),
            ),
            Card(
              margin:  EdgeInsets.all(50),
              borderOnForeground: false,
              child: Padding(
                padding:  EdgeInsets.all(32.0),
                child: VzText.typePrimary(data: "card border false"),
              ),
            )
          ],
        ),
      ],
    );
  }
}
