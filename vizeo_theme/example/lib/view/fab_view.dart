import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class FabView extends StatelessWidget {
  const FabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VzFab(
              icon: Icons.add_rounded,
              onTap: () => debugPrint("FAB CUSTOM"),
              size: 50.0,
            ),
            VzFab(
              icon: Icons.add_rounded,
              onTap: () => null,
              size: 50.0,
            ),
          ],
        )
      ],
    );
  }
}
