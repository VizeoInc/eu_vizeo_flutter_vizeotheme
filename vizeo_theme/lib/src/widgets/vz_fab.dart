import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';

class VzFab extends StatefulWidget {
  final Function() onTap;
  final IconData icon;
  final double size;
  final double? circleSize;
  final Color iconColor;
  final Color? iconColorPressed;
  final Color borderColor;
  final Color? backgroundColor;
  final double borderSize;
  final Key? key;

  const VzFab({
    required this.icon,
    required this.onTap,
    this.iconColor = VzColor.redVizeo,
    this.borderColor = VzColor.redVizeo,
    this.backgroundColor,
    this.iconColorPressed,
    this.size = 20.0,
    this.circleSize,
    this.borderSize = 1.0,
    this.key,
  });

  @override
  State<VzFab> createState() => _VzFabState();
}

class _VzFabState extends State<VzFab> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colorPressed = widget.iconColorPressed ?? VzColor.textOnRedVizeo;
    final double borderRadius =
        widget.circleSize != null ? widget.circleSize! / 2 : widget.size / 2;

    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: widget.circleSize ?? widget.size + (widget.size * 0.4),
        height: widget.circleSize ?? widget.size + (widget.size * 0.4),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderSize,
          ),
          color: widget.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          highlightColor: VzColor.redVizeo,
          onHighlightChanged: (_) {
            isPressed = !isPressed;
            setState(() {});
          },
          onTap: widget.onTap,
          child: Icon(
            widget.icon,
            size: widget.size,
            color: isPressed ? colorPressed : widget.iconColor,
          ),
        ),
      ),
    );
  }
}
