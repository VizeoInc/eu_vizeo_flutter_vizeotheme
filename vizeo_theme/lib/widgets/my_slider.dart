part of '../vizeo_theme.dart';

class MySlider extends StatefulWidget {
  MySlider({
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.backColor = redVizeo,
    this.cursorColor = white,
  });

  late double value;
  late Function(double) onChanged;
  late double min;
  late double max;
  late Color backColor;
  late Color cursorColor;

  @override
  _MySlider createState() => _MySlider();
}

class _MySlider extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: widget.value.toDouble(),
      min: widget.min,
      max: widget.max,
      activeColor: widget.backColor,
      thumbColor: widget.cursorColor,
      onChanged: (double newValue) {
        setState(() {
          widget.value = newValue.round() as double;
          widget.onChanged(widget.value);
        });
      },
    );
  }
}
