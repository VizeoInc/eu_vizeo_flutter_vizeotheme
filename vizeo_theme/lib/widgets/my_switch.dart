part of '../vizeo_theme.dart';

class MySwitch extends StatefulWidget {
  MySwitch({
    required this.value,
    required this.onChanged,
  });

  late Function(bool) onChanged;
  late bool value;

  @override
  _MySwitch createState() => _MySwitch();

  CupertinoSwitch getMySwitch() => getMySwitch();
}

class _MySwitch extends State<MySwitch> {
  late CupertinoSwitch _switch;

  CupertinoSwitch getMySwitch() {
    return _switch;
  }

  @override
  Widget build(BuildContext context) {
    return _switch = CupertinoSwitch(
        value: widget.value,
        trackColor: redNegativeWarning,
        activeColor: greenValidate,
        onChanged: (bool value) {
          setState(() {
            widget.value = !widget.value;
            widget.onChanged(value);
          });
        });
  }
}
