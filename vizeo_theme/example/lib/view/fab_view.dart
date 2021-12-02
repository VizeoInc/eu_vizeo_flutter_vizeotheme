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
            Container(
              color: Colors.amber,
              child: VzFab(
                icon: Icons.question_answer_outlined,
                onTap: () => debugPrint("FAB 50"),
                size: 50.0,
              ),
            ),
            Container(
              color: Colors.amber,
              child: VzFab(
                icon: Icons.add_rounded,
                onTap: () => debugPrint("FAB 50"),
                size: 50.0,
                circleSize: 70,
              ),
            ),
            Container(
              color: Colors.amberAccent,
              child: VzFab(
                icon: Icons.add_rounded,
                onTap: () => debugPrint("FAB Base"),
              ),
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
