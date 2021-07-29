part of '../vizeo_theme.dart';

class MySlider extends StatefulWidget {
  MySlider({
    required this.value,
    required this.onChanged,
    this.width,
    this.min = 0,
    this.max = 100,
    this.division,
    this.backColor = ColorVizeo.redVizeo,
    this.cursorColor = ColorVizeo.white,
  });

  late double value;
  late Function(double) onChanged;
  late double? width;
  late double min;
  late double max;
  late int? division;
  late Color backColor;
  late Color cursorColor;

  @override
  _MySlider createState() => _MySlider();

  CupertinoSlider getMySlider() => getMySlider();
}

class _MySlider extends State<MySlider> {
  late CupertinoSlider _slide;

  CupertinoSlider getMySlider() {
    return _slide;
  }

  @override
  Widget build(BuildContext context) {
    _slide = CupertinoSlider(
      value: widget.value.toDouble(),
      min: widget.min,
      max: widget.max,
      divisions: widget.division,
      activeColor: widget.backColor,
      thumbColor: widget.cursorColor,
      onChanged: (double newValue) {
        setState(() {
          widget.value = newValue.round() as double;
          widget.onChanged(widget.value);
        });
      },
    );

    return Container(
      width: (widget.width != null) ? widget.width : null,
      child: _slide,
    );
  }
}
