import 'package:flutter/cupertino.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class VzSwitch extends StatefulWidget {
  late bool value;
  late Function(bool) onChanged;

  VzSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  _MySwitch createState() => _MySwitch();

  CupertinoSwitch getMySwitch() => getMySwitch();
}

class _MySwitch extends State<VzSwitch> {
  late CupertinoSwitch _switch;

  CupertinoSwitch getMySwitch() {
    return _switch;
  }

  @override
  Widget build(BuildContext context) {
    return _switch = CupertinoSwitch(
      value: widget.value,
      trackColor: VzColor.redError,
      activeColor: VzColor.greenValidation,
      onChanged: (bool value) {
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(value);
        });
      },
    );
  }
}
