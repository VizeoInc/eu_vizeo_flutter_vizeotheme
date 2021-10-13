import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class VzSlider extends StatefulWidget {
  late double value;
  late Function(double) onChanged;
  late double? width;
  late double min;
  late double max;
  late int? division;
  late Color backColor;
  late Color cursorColor;
  late String? label;
  bool isEnable;

  VzSlider({
    required this.value,
    required this.onChanged,
    this.width,
    this.min = 0,
    this.max = 100,
    this.division,
    this.backColor = VzColor.redVizeo,
    this.cursorColor = VzColor.white,
    this.label,
    this.isEnable = true,
  });

  VzSlider.typeImportant({
    required this.value,
    required this.onChanged,
    this.width,
    this.min = 0,
    this.max = 100,
    this.division,
    this.backColor = VzColor.redVizeo,
    this.cursorColor = VzColor.white,
    this.label,
    this.isEnable = true,
  });

  VzSlider.typeDiscret({
    required this.value,
    required this.onChanged,
    this.width,
    this.min = 0,
    this.max = 100,
    this.division,
    this.backColor = VzColor.accentLight,
    this.cursorColor = VzColor.white,
    this.label,
    this.isEnable = true,
  });

  @override
  _MySlider createState() => _MySlider();

  Slider getMySlider() => getMySlider();
}

class _MySlider extends State<VzSlider> {
  late Slider _slide;

  Slider getMySlider() {
    return _slide;
  }

  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    _slide = Slider(
      value: widget.value.toDouble(),
      min: widget.min as double,
      max: widget.max as double,
      label: widget.label,
      divisions: widget.division == null ? widget.max as int : widget.division,
      activeColor: widget.isEnable ? widget.backColor : widget.backColor.withOpacity(0.2),
      thumbColor: widget.isEnable ? widget.cursorColor : widget.cursorColor.withOpacity(0.8),
      onChanged: (double newValue) {
        if (widget.isEnable) {
          setState(() {
            widget.value = newValue.round() as double;
            widget.onChanged(widget.value);
          });
        } else {
          widget.value = widget.value;
        }
      },
    );

    return Container(
      width: (widget.width != null) ? widget.width : null,
      child: _slide,
    );
  }
}
