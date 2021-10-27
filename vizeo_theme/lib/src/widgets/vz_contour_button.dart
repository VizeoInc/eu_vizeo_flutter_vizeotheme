import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';
import 'package:vizeo_theme/src/widgets/vz_text.dart';

enum _TypeContourButton {
  primary,
  secondary,
  small,
  notype,
}

class VzContourButton extends StatefulWidget {
  final String title;
  final VoidCallback? onPressed;
  late Color color;
  late Color? textColor;
  late final double radius;
  late final EdgeInsets padding;
  late final EdgeInsets iconPadding;
  final Widget? rightChild;
  final Widget? leftChild;
  late final double fontSize;
  late final FontWeight fontWeight;
  late final bool isEnable;
  final FocusNode? focus;
  final TextStyle? textStyleCustom;
  late final _TypeContourButton type;

  VzContourButton.typePrimary({
    required this.onPressed,
    required this.title,
    this.textColor,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.leftChild,
    this.rightChild,
    this.radius = 5.0,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
  })  : type = _TypeContourButton.primary,
        color = VzColor.redVizeo,
        super();

  VzContourButton.typeSecondary({
    required this.onPressed,
    required this.title,
    this.textColor,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
  })  : type = _TypeContourButton.secondary,
        color = VzColor.textOnRedVizeo,
        super();

  VzContourButton.typeSmall({
    required this.onPressed,
    required this.title,
    this.textColor,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
  })  : type = _TypeContourButton.small,
        color = Colors.amber,
        super();

  @override
  _VzContourButtonState createState() => _VzContourButtonState();
}

class _VzContourButtonState extends State<VzContourButton> {
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    // change value has focus when user click on TextField
    widget.focus?.addListener(() {
      if (widget.focus!.hasFocus) {
        hasFocus = true;
      } else {
        hasFocus = false;
      }
      setState(() {});
    });
  }

  ButtonStyle myStyleConfig(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (widget.type == _TypeContourButton.primary) {
          return widget.isEnable
              ? VzColor.transparent
              : VzColor.secondaryButton.withOpacity(0.3);
        }
        if (widget.type == _TypeContourButton.secondary) {
          return widget.isEnable
              ? VzColor.transparent
              : VzColor.secondaryButton.withOpacity(0.3);
        }
        if (widget.type == _TypeContourButton.small) {
          return widget.isEnable
              ? VzColor.transparent
              : VzColor.secondaryButton.withOpacity(0.3);
        }

        return widget.isEnable
            ? VzColor.transparent
            : VzColor.secondaryButton.withOpacity(0.3);
      }),

      ///-----Shadow du bouton
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
      shadowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),

      /// style du fond suivant les etats
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          if (widget.type == _TypeContourButton.primary) {
            return widget.isEnable
                ? widget.color
                : VzColor.secondaryButton.withOpacity(0.3);
          }
          if (widget.type == _TypeContourButton.secondary) {
            return widget.isEnable
                ? widget.color
                : VzColor.secondaryButton.withOpacity(0.3);
          }
          if (widget.type == _TypeContourButton.small) {
            return widget.isEnable
                ? widget.color
                : VzColor.secondaryButton.withOpacity(0.3);
          }
        }
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable
              ? widget.color.withOpacity(0.2)
              : VzColor.transparent;
        }
        if (states.contains(MaterialState.hovered)) {
          return widget.isEnable
              ? widget.color.withOpacity(0.2)
              : VzColor.transparent;
        }

        return VzColor.transparent;
      }),

      /// style du text suivant les etats
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return VzColor.white;
        }
        return widget.color;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type != _TypeContourButton.primary &&
        widget.type != _TypeContourButton.notype) {
      widget.color = VzColor.contourButtonSecondary();
    }
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: widget.color,
        ),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: myStyleConfig(context),
        focusNode: widget.focus,
        child: Padding(
          padding: widget.padding,
          child: () {
            switch (widget.type) {
              case _TypeContourButton.primary:
                return VzText.typePrimary(
                  data: widget.title,
                  textStyleCustom: widget.textStyleCustom,
                  color: widget.textColor ?? VzColor.redVizeo,
                );
              case _TypeContourButton.secondary:
                return VzText.typeSecondary(
                  data: widget.title,
                  textStyleCustom: widget.textStyleCustom,
                  color: widget.textColor ?? widget.color,
                );
              case _TypeContourButton.small:
                return VzText.typePrimary(
                  data: widget.title,
                  textStyleCustom: widget.textStyleCustom,
                  color: widget.textColor ?? widget.color,
                );
              default:
            }
          }(),
        ),
      ),
    );
  }
}
