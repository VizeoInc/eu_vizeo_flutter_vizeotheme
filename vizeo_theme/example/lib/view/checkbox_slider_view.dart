import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class CheckboxSliderView extends StatefulWidget {
  const CheckboxSliderView({Key? key}) : super(key: key);

  @override
  State<CheckboxSliderView> createState() => _CheckboxSliderViewState();
}

class _CheckboxSliderViewState extends State<CheckboxSliderView> {
  bool checkBoxOne = false;

  var actualRadio;

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
    return Column(
      children: [
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
      ],
    );
  }
}
