import 'package:flutter/material.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';

class VzRadioButton extends StatefulWidget {
  late dynamic value;
  late Object? groupValue;
  late Function(dynamic)? onChanged;

  VzRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  _VzRadioButton createState() => _VzRadioButton();

  Radio getVzRadioButton() => getVzRadioButton();
}

class _VzRadioButton extends State<VzRadioButton> {
  late Radio _RadioButton;

  Radio getVzRadioButton() {
    return _RadioButton;
  }

  @override
  Widget build(BuildContext context) {
    return _RadioButton = Radio(
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: widget.onChanged,
      activeColor: VzColor.redVizeo,
    );
  }
}
