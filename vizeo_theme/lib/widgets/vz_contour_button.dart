import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/vz_strings.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';

enum _TypeButton { PRIMARY, SECONDARY, SMALL, NOTYPE }

class VzContourButton extends StatefulWidget {
  late final String? myTitle, myFont;
  late final VoidCallback? onPressedFunc;
  late Color myColor, myTextColor;
  late final double myRadius;
  late final EdgeInsets myPadding;
  late final EdgeInsets myIconPadding;
  final Widget? myRightChild, myLeftChild;
  late final double myFontSize;
  late final FontWeight myFontWeight;
  late final bool isEnable;
  final FocusNode? focus;
  late final _TypeButton type;

  VzContourButton({
    required this.onPressedFunc,
    this.myTitle,
    this.myTextColor = VzColor.textPrimaryLight,
    this.myColor = VzColor.transparent,
    this.myRadius = 5.0,
    this.myPadding = const EdgeInsets.all(8.0),
    this.myIconPadding = const EdgeInsets.all(8.0),
    this.myRightChild,
    this.myLeftChild,
    this.myFontSize = 15,
    this.myFontWeight = FontWeight.normal,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.NOTYPE,
  });

  VzContourButton.typePrimary({
    required this.onPressedFunc,
    this.myTitle,
    this.myTextColor = VzColor.redVizeo,
    this.myColor = VzColor.redVizeo,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myLeftChild,
    this.myRightChild,
    this.myRadius = 5.0,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.PRIMARY,
  });

  VzContourButton.typeSecondary({
    required this.onPressedFunc,
    this.myTitle,
    this.myTextColor = VzColor.textOnRedVizeo,
    this.myColor = VzColor.transparent,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.SECONDARY,
  });

  VzContourButton.typeSmall({
    required this.onPressedFunc,
    this.myTitle,
    this.myTextColor = VzColor.textOnRedVizeo,
    this.myColor = VzColor.transparent,
    this.myPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.SMALL,
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
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (widget.type == _TypeButton.PRIMARY) {
          return widget.isEnable ? VzColor.transparent : VzColor.secondaryButton.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.SECONDARY) {
          //widget.myBackgroundColor = VzColor.secondaryButtonColor(context: context, isReverse: false);
          return widget.isEnable ? VzColor.transparent : VzColor.secondaryButton.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.SMALL) {
          //widget.myBackgroundColor = VzColor.secondaryButtonColor(context: context, isReverse: false);
          return widget.isEnable ? VzColor.transparent : VzColor.secondaryButton.withOpacity(0.3);
        }

        return widget.isEnable ? VzColor.transparent : VzColor.secondaryButton.withOpacity(0.3);
      }),

      ///-----Shadow du bouton
      shape:
          MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.myRadius))),
      shadowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),

      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable
              ? BorderSide(
                  color: widget.myTextColor,
                )
              : null;
        }
      }),

      /// style du fond suivant les etats
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          if (widget.type == _TypeButton.PRIMARY) {
            return widget.isEnable ? widget.myColor : VzColor.secondaryButton.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.SECONDARY) {
            return widget.isEnable ? widget.myColor : VzColor.secondaryButton.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.SMALL) {
            return widget.isEnable ? widget.myColor : VzColor.secondaryButton.withOpacity(0.3);
          }
        }
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable ? widget.myColor.withOpacity(0.2) : Colors.transparent;
        }
        if (states.contains(MaterialState.hovered)) {
          return widget.isEnable ? widget.myColor.withOpacity(0.2) : Colors.transparent;
        }

        return Colors.transparent;
      }),

      /// style du text suivant les etats

      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return VzColor.white;
        }
        return widget.myColor;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type != _TypeButton.PRIMARY) {
      widget.myColor = VzColor.contourButtonSecondary(context: context);
    }
    return _button = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: widget.myColor,
        ),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressedFunc,

        ///-----Background du bouton
        style: myStyleConfig(context),
        focusNode: widget.focus,
        child: Padding(
          padding: widget.myPadding,
          child: Text(
            widget.myTitle!,
            style: TextStyle(
              fontSize: widget.myFontSize,
              fontWeight: widget.myFontWeight,
              fontFamily: widget.myFont,
            ),
          ),
        ),
      ),
    );
  }
}
