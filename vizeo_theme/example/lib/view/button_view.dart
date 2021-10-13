import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typePrimary(
                title: "PRIMARY",
                onPressed: () => debugPrint("PRIMARY"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typeSecondary(
                title: "SECONDARY",
                onPressed: () => debugPrint("SECONDARY"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typeTertiary(
                title: "TERTIARY",
                onPressed: () => debugPrint("TERTIARY"),
                // backgroundColor: VzColor.white,
                textColor: VzColor.redNegativeWarning,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typeSmall(
                title: "SMALL",
                onPressed: () => debugPrint("SMALL"),
                textColor: VzColor.greenValidate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typeSmall(
                title: "System",
                onPressed: () {
                  // sets theme mode to system
                  EasyDynamicTheme.of(vzThemeKey.currentContext!)
                      .changeTheme(dynamic: true);
                },
                focus: FocusNode(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typeSmall(
                title: "Light",
                onPressed: () {
                  // sets theme mode to light
                  final randomBright = Theme.of(context).brightness;
                  EasyDynamicTheme.of(vzThemeKey.currentContext!)
                      .changeTheme(dark: false);
                },
                focus: FocusNode(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VzButton.typeSmall(
                title: "Dark",
                textStyleBasic: TypeDeTextStyle.h1,
                onPressed: () {
                  // sets theme mode to dark
                  EasyDynamicTheme.of(vzThemeKey.currentContext!)
                      .changeTheme(dark: true);
                  final randomBright = Theme.of(context).brightness;
                },
                focus: FocusNode(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
