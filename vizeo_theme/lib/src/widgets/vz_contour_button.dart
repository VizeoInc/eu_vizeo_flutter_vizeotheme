import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/vz_strings.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';

enum _TypeButton { primary, secondary, small, notype }

class VzContourButton extends StatefulWidget {
  late final String? title, font;
  late final VoidCallback? onPressed;
  late Color color, textColor;
  late final double radius;
  late final EdgeInsets padding;
  late final EdgeInsets iconPadding;
  final Widget? rightChild, leftChild;
  late final double myFontSize;
  late final FontWeight myFontWeight;
  late final bool isEnable;
  final FocusNode? focus;
  late final _TypeButton type;

  VzContourButton({
    required this.onPressed,
    required this.title,
    this.textColor = VzColor.textPrimaryLight,
    this.color = VzColor.transparent,
    this.radius = 5.0,
    this.padding = const EdgeInsets.all(8.0),
    this.iconPadding = const EdgeInsets.all(8.0),
    this.rightChild,
    this.leftChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.font = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.notype,
  });

  VzContourButton.typePrimary({
    required this.onPressed,
    required this.title,
    this.textColor = VzColor.redVizeo,
    this.color = VzColor.redVizeo,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.leftChild,
    this.rightChild,
    this.radius = 5.0,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.font = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.primary,
  });

  VzContourButton.typeSecondary({
    required this.onPressed,
    required this.title,
    this.textColor = VzColor.textOnRedVizeo,
    this.color = VzColor.transparent,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.font = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.secondary,
  });

  VzContourButton.typeSmall({
    required this.onPressed,
    required this.title,
    this.textColor = VzColor.textOnRedVizeo,
    this.color = VzColor.transparent,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.font = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.small,
  });

  @override
  _VzContourButtonState createState() => _VzContourButtonState();

  Container getMyButton() => getMyButton();
}

class _VzContourButtonState extends State<VzContourButton> {
  bool hasFocus = false;
  late Container _button;

  Container getMyButton() {
    return _button;
  }

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

  /*List<Widget> maListChild() {
    final List<Widget> listChild = [];
    if (widget.myLeftChild != null) {
      listChild.add(widget.myLeftChild!);
      listChild.add(Padding(
        padding: widget.myIconPadding,
      ));
    }
    if (widget.myTitle != null) {
      listChild.add(Text(
        widget.myTitle!,
        style: TextStyle(
          fontSize: widget.myFontSize,
          fontWeight: widget.myFontWeight,
          fontFamily: widget.myFont,
        ),
      ));
    }
    if (widget.myRightChild != null) {
      listChild.add(Padding(
        padding: widget.myIconPadding,
      ));
      listChild.add(widget.myRightChild!);
    }
    return listChild;
  }*/

  ButtonStyle myStyleConfig(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (widget.type == _TypeButton.primary) {
          return widget.isEnable
              ? VzColor.transparent
              : VzColor.secondaryButton.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.secondary) {
          //widget.myBackgroundColor = VzColor.secondaryButtonColor(context: context, isReverse: false);
          return widget.isEnable
              ? VzColor.transparent
              : VzColor.secondaryButton.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.small) {
          //widget.myBackgroundColor = VzColor.secondaryButtonColor(context: context, isReverse: false);
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
              borderRadius: BorderRadius.circular(widget.radius))),
      shadowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),

      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable
              ? BorderSide(
                  color: widget.textColor,
                )
              : null;
        }
      }),

      /// style du fond suivant les etats
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          if (widget.type == _TypeButton.primary) {
            return widget.isEnable
                ? widget.color
                : VzColor.secondaryButton.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.secondary) {
            return widget.isEnable
                ? widget.color
                : VzColor.secondaryButton.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.small) {
            return widget.isEnable
                ? widget.color
                : VzColor.secondaryButton.withOpacity(0.3);
          }
        }
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable
              ? widget.color.withOpacity(0.2)
              : Colors.transparent;
        }
        if (states.contains(MaterialState.hovered)) {
          return widget.isEnable
              ? widget.color.withOpacity(0.2)
              : Colors.transparent;
        }

        return Colors.transparent;
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
    if (widget.type != _TypeButton.primary &&
        widget.type != _TypeButton.notype) {
      widget.color = VzColor.contourButtonSecondary();
    }
    return _button = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: widget.color,
        ),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,

        ///-----Background du bouton
        style: myStyleConfig(context),
        focusNode: widget.focus,
        child: Padding(
          padding: widget.padding,
          child: Text(
            widget.title!,
            style: TextStyle(
              fontSize: widget.myFontSize,
              fontWeight: widget.myFontWeight,
              fontFamily: widget.font,
            ),
          ),
        ),
      ),
    );
  }
}
