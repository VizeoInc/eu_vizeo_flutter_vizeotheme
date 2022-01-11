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
              icon: Icons.question_answer_outlined,
              onTap: () => debugPrint("FAB 50"),
              size: 100.0,
            ),
            VzFab(
              icon: Icons.question_answer_outlined,
              onTap: () => debugPrint("FAB 50"),
              size: 50.0,
            ),
            VzFab(
              icon: Icons.add_rounded,
              onTap: () => debugPrint("FAB 50"),
              size: 50.0,
            ),
            VzFab(
              size: 24.0,
              icon: Icons.add_rounded,
              onTap: () => debugPrint("FAB add_rounded"),
            ),
            VzFab(
              size: 24.0,
              icon: Icons.question_answer_outlined,
              onTap: () => debugPrint("FAB question_answer_outlined"),
            ),
            VzFab(
              size: 24.0,
              icon: Icons.check,
              onTap: () => debugPrint("FAB check"),
            ),
            VzFab(
              icon: Icons.add_rounded,
              onTap: () => debugPrint("FAB 10"),
              size: 10.0,
            ),
          ],
        )
      ],
    );
  }
}
