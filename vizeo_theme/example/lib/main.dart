import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:example/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:vizeo_theme/private/enum.dart';

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
  bool checkBoxOne = false;

  var _nameTest = "";
  var actualRadio;

  final textEditingControllerBase = TextEditingController();
  final textEditingControllerMail = TextEditingController();
  final textEditingControllerPwd = TextEditingController();
  final textEditingControllerPhone = TextEditingController();

  final focudNode = FocusNode();

  List<Widget> vzRadio() {
    final List<Widget> l = [];
    for (var x = 0; x < 3; x++) {
      final row = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Valeur #${x + 1}"),
          VzRadioButton(
            value: x,
            groupValue: actualRadio,
            onChanged: (i) {
              setState(() {
                actualRadio = i;
              });
            },
          )
        ],
      );
      l.add(row);
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    final brigtNotShecd = Theme.of(vzThemeKey.currentContext!).brightness;
    return Scaffold(
      appBar: AppBar(
        title: VzText.typePrimary(data: "Widget Totale LOCAL"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VzTextForm(
                      width: 200.0,
                      controller: textEditingControllerBase,
                      onChanged: (txt) {
                        _nameTest = textEditingControllerBase.text;
                        setState(() {});
                      },
                      focus: focudNode,
                      hint: "hint",
                    ),
                    VzTextForm.typeMail(
                      width: 200.0,
                      controller: textEditingControllerMail,
                      onFieldSubmitted: (txt) {
                        _nameTest = textEditingControllerMail.text;
                        setState(() {});
                      },
                    ),
                    VzTextForm.typePassword(
                      width: 200.0,
                      controller: textEditingControllerPwd,
                      onFieldSubmitted: (txt) {
                        _nameTest = textEditingControllerPwd.text;
                        debugPrint("name test => $_nameTest");
                        if (_nameTest.isNotEmpty) {
                          Get.to(const SecondScreen());
                        } else {
                          debugPrint("HEU");
                        }
                      },
                    ),
                    VzTextForm.typeTelNumber(
                      width: 200.0,
                      controller: textEditingControllerPhone,
                      onFieldSubmitted: (txt) {
                        _nameTest = textEditingControllerBase.text;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                VzText.typeTertiary(
                  data: "Valeur Text Field Base => $_nameTest",
                ),
                VzTextForm(
                  controller: textEditingControllerBase,
                  onFieldSubmitted: (txt) => debugPrint(""),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VzText.typePrimary(data: "Primary"),
                VzText.typePrimary(
                  data: "Primary Custom",
                  textStyleCustom: const TextStyle(
                    color: Colors.green,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VzText.typeSecondary(data: "Secondary"),
                VzText.typeSecondary(
                  data: "Secondary Custom",
                  textStyleCustom: const TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VzText.typeTertiary(data: "Tertiary"),
                VzText.typeTertiary(
                  data: "Tertiary Custom",
                  textStyleCustom: const TextStyle(
                    color: Colors.red,
                    fontSize: 8.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VzText.typePrimary(data: "H1", style: TypeDeTextStyle.h1),
                VzText.typePrimary(data: "H2", style: TypeDeTextStyle.h2),
                VzText.typePrimary(data: "H3", style: TypeDeTextStyle.h3),
                VzText.typePrimary(data: "H4", style: TypeDeTextStyle.h4),
                VzText.typePrimary(data: "H5", style: TypeDeTextStyle.h5),
                VzText.typePrimary(data: "H6", style: TypeDeTextStyle.h6),
                VzText.typePrimary(data: "Body1"),
                VzText.typePrimary(data: "Body2", style: TypeDeTextStyle.body2),
                VzText.typePrimary(data: "Body3", style: TypeDeTextStyle.body3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VzTextSelectable.typePrimary(data: "Selectable Primary"),
                VzTextSelectable.typePrimary(
                  data: "Selectable Primary Custom",
                  textStyleCustom: const TextStyle(
                    color: Colors.green,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VzTextSelectable.typeSecondary(data: "Selectable Secondary"),
                VzTextSelectable.typeSecondary(
                  data: "Selectable Secondary Custom",
                  textStyleCustom: const TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VzTextSelectable.typeTertiary(data: "Selectable Tertiary"),
                VzTextSelectable.typeTertiary(
                  data: "Selectable Tertiary Custom",
                  textStyleCustom: const TextStyle(
                    color: Colors.red,
                    fontSize: 8.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VzTextSelectable.typePrimary(
                    data: "H1", style: TypeDeTextStyle.h1),
                VzTextSelectable.typePrimary(
                    data: "H2", style: TypeDeTextStyle.h2),
                VzTextSelectable.typePrimary(
                    data: "H3", style: TypeDeTextStyle.h3),
                VzTextSelectable.typePrimary(
                    data: "H4", style: TypeDeTextStyle.h4),
                VzTextSelectable.typePrimary(
                    data: "H5", style: TypeDeTextStyle.h5),
                VzTextSelectable.typePrimary(
                    data: "H6", style: TypeDeTextStyle.h6),
                VzTextSelectable.typePrimary(data: "Body1"),
                VzTextSelectable.typePrimary(
                    data: "Body2", style: TypeDeTextStyle.body2),
                VzTextSelectable.typePrimary(
                    data: "Body3", style: TypeDeTextStyle.body3),
              ],
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => debugPrint("elevated button"),
                    child: VzText.typePrimary(data: "elevated button"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () => {},
                    child: VzText.typePrimary(data: "Outlined button"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => {},
                    child: VzText.typePrimary(data: "Outlined button"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: vzRadio(),
                ),
                VzCheckbox(
                  value: checkBoxOne,
                  onChanged: (value) {
                    checkBoxOne = value;
                    debugPrint("checkbox one => $checkBoxOne");
                  },
                ),
                VzSlider(
                  value: 50,
                  min: 1,
                  onChanged: (value) => {debugPrint("switch $value")},
                ),
                Slider(
                  value: 50,
                  min: 1,
                  max: 100,
                  onChanged: (value) {},
                  divisions: 5,
                ),
                VzSwitch(
                  value: true,
                  onChanged: (value) => {debugPrint("switch")},
                ),
                VzSwitch(
                  value: false,
                  onChanged: (value) => debugPrint("switch"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: VzColor.backgroundPrimary(),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(),
                  ),
                  child: Center(
                    child: VzText.typePrimary(data: "Pimary"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: VzColor.backgroundSecondary(),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(),
                  ),
                  child: Center(
                    child: VzText.typeSecondary(data: "Secondary"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: VzColor.backgroundTertiary(),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(),
                  ),
                  child: Center(
                    child: VzText.typeTertiary(data: "Tertiary"),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
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
        ),
      ),
    );
  }
}
