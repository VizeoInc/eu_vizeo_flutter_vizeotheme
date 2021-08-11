import 'package:flutter/material.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';

class VzRadioButton extends StatefulWidget {
  late final dynamic value;
  late final Object? groupValue;
  late final Function(dynamic)? onChanged;

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
  late Radio _radioButton;

  Radio getVzRadioButton() {
    return _radioButton;
  }

  @override
  Widget build(BuildContext context) {
    return _radioButton = Radio(
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: widget.onChanged,
      activeColor: VzColor.redVizeo,
    );
  }
}
