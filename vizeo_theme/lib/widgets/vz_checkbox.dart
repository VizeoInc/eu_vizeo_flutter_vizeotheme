import 'package:flutter/material.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';

class VzCheckbox extends StatefulWidget {
  late bool value;
  late Function(bool) onChanged;

  VzCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  _VzCheckboxState createState() => _VzCheckboxState();
}

class _VzCheckboxState extends State<VzCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: VzColor.backgroundPrimary(isReverse: true),
        fillColor: MaterialStateProperty.resolveWith((states) {
          return VzColor.backgroundPrimary(isReverse: true);
        }),
        value: widget.value,
        onChanged: (bool? value) {
          setState(() {
            widget.value = !widget.value;
            if (value != null) {
              widget.onChanged(value);
            } else {
              debugPrint("Heu tu a mal affecter ta variable a value");
            }
          });
        });
  }
}
