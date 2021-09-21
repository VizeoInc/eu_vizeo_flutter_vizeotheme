import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';

class VzFab extends StatefulWidget {
  late final Function() onTap;
  late final IconData icon;
  late final double size;
  late final Color iconColor;
  late final Color iconColorPressed;
  late final Color borderColor;

  VzFab({
    required this.icon,
    required this.onTap,
    this.iconColor = VzColor.redVizeo,
    this.iconColorPressed = VzColor.white,
    this.borderColor = VzColor.redVizeo,
    this.size = 20,
  });

  @override
  State<VzFab> createState() => _VzFabState();
}

class _VzFabState extends State<VzFab> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      key: const Key("VzFab"),
      fillColor: Colors.transparent,
      hoverColor: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
          width: 4.0,
          color: isPressed ? widget.iconColorPressed : widget.borderColor,
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
        color: isPressed ? widget.iconColorPressed : widget.iconColor,
      ),
    );
  }
}
