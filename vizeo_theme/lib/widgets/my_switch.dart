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
}

class _MySwitch extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: widget.value,
        activeColor: greenValidate,
        trackColor: redNegativeWarning,
        onChanged: (bool value) {
          setState(() {
            widget.value = !widget.value;
            widget.onChanged(value);
          });
        });
  }
}
