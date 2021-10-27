import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';

class VzFab extends StatefulWidget {
  final Function() onTap;
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color? iconColorPressed;
  final Color borderColor;
  final Color? backgroundColor;
  final double borderSize;
  final Key? key;

  VzFab({
    required this.icon,
    required this.onTap,
    this.iconColor = VzColor.redVizeo,
    this.borderColor = VzColor.redVizeo,
    this.backgroundColor,
    this.iconColorPressed,
    this.size = 20.0,
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

    return MaterialButton(
      key: widget.key,
      height: widget.size + 5,
      color: widget.backgroundColor,
      hoverColor: widget.backgroundColor,
      shape: CircleBorder(
        side: BorderSide(
          width: widget.borderSize,
          color: widget.borderColor,
        ),
      ),
      onPressed: widget.onTap,
      highlightColor: VzColor.redVizeo,
      onHighlightChanged: (_) {
        isPressed = !isPressed;
        setState(() {});
      },
      child: Icon(
        widget.icon,
        size: widget.size,
        color: isPressed ? colorPressed : widget.iconColor,
      ),
    );
  }
}
