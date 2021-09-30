import 'package:flutter/material.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';

class VzFab extends StatefulWidget {
  late final Function() onTap;
  late final IconData icon;
  late final double size;
  late final Color iconColor;
  late final Color? iconColorPressed;
  late final Color borderColor;
  Color? backgroundColor;
  late final double borderSize;

  VzFab(
      {required this.icon,
      required this.onTap,
      this.iconColor = VzColor.redVizeo,
      this.borderColor = VzColor.redVizeo,
      this.backgroundColor,
      this.iconColorPressed,
      this.size = 20.0,
      this.borderSize = 1.0});

  @override
  State<VzFab> createState() => _VzFabState();
}

class _VzFabState extends State<VzFab> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colorPressed = widget.iconColorPressed ?? VzColor.transparent;

    return MaterialButton(
      key: const Key("VzFab"),
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
