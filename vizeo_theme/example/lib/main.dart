import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:example/view/button_contour_view.dart';
import 'package:example/view/button_view.dart';
import 'package:example/view/card_view.dart';
import 'package:example/view/checkbox_slider_view.dart';
import 'package:example/view/color_view.dart';
import 'package:example/view/fab_view.dart';
import 'package:example/view/form_view.dart';
import 'package:example/view/search_view.dart';
import 'package:example/view/text_size.dart';
import 'package:example/view/text_view.dart';
import 'package:example/view/text_view_selectable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:vizeo_theme/vizeo_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyDynamicThemeWidget(
    initialThemeMode: ThemeMode.dark,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      final brigtShecd = Theme.of(vzThemeKey.currentContext!).brightness;
    });
    return GetMaterialApp(
      theme: vzThemeLight(),
      darkTheme: vzThemeDark(),
      themeMode: EasyDynamicTheme.of(context).themeMode!,
      navigatorKey: vzThemeKey,
      home: const WidgetTotales(),
    );
  }
}

class WidgetTotales extends StatefulWidget {
  const WidgetTotales({Key? key}) : super(key: key);

  @override
  _WidgetTotalesState createState() => _WidgetTotalesState();
}

class _WidgetTotalesState extends State<WidgetTotales> {
  static const space = 50.0;
  @override
  Widget build(BuildContext context) {
    final brigtNotShecd = Theme.of(vzThemeKey.currentContext!).brightness;
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: const [
            Gap(space),
            TitlePart(title: "VzForm"),
            FormView(),
            Gap(space),
            TitlePart(title: "VzButton"),
            ButtonView(),
            Gap(space),
            TitlePart(title: "VzContourButton"),
            ButtonContourView(),
            Gap(space),
            TitlePart(title: "VzCard"),
            CardView(),
            Gap(space),
            TitlePart(title: "VzCheckbox VzSlider"),
            CheckboxSliderView(),
            Gap(space),
            TitlePart(title: "VzColor"),
            ColorView(),
            Gap(space),
            TitlePart(title: "VzFab"),
            FabView(),
            Gap(space),
            TitlePart(title: "VzSearch Bar"),
            SearchView(),
            Gap(space),
            TitlePart(title: "Text Size"),
            TextSize(),
            Gap(space),
            TitlePart(title: "VzText"),
            TextView(),
            Gap(space),
            TitlePart(title: "VzText Selectable"),
            TextViewSelectable(),
            Gap(space),
          ],
        ),
      ),
    );
  }
}

class TitlePart extends StatelessWidget {
  const TitlePart({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      VzText.typePrimary(
        data: title,
        style: TypeDeTextStyle.h1,
      ),
      const Gap(15.0),
    ]);
  }
}
