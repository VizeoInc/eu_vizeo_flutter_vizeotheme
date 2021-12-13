import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';

class VzCheckbox extends StatefulWidget {
  late bool value;
  late Function(bool) onChanged;
  bool isEnable;

  VzCheckbox({
    required this.value,
    required this.onChanged,
    this.isEnable = true,
  });

  @override
  _VzCheckboxState createState() => _VzCheckboxState();
}

class _VzCheckboxState extends State<VzCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: widget.isEnable
          ? VzColor.backgroundPrimary(isReverse: true)
          : VzColor.backgroundPrimary(isReverse: true).withOpacity(0.4),
      fillColor: MaterialStateProperty.resolveWith((states) {
        return widget.isEnable
            ? VzColor.backgroundPrimary(isReverse: true)
            : VzColor.backgroundPrimary(isReverse: true).withOpacity(0.4);
      }),
      value: widget.value,
      onChanged: (bool? value) {
        if (widget.isEnable) {
          setState(() {
            widget.value = !widget.value;
            if (value != null) {
              widget.onChanged(value);
            } else {
              debugPrint("Heu tu a mal affecter ta variable a value");
            }
          });
        }
      },
    );
  }
}
