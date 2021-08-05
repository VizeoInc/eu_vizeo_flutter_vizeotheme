import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/vz_strings.dart';

class VzButton extends StatefulWidget {
  late final String myFont;
  late final VoidCallback? onPressedFunc;
  late final Color myBackgroundColor, myHoveredColor, myTextColor;
  late final double myRadius;
  late final EdgeInsets myPadding;
  late final EdgeInsets myIconPadding;
  final Widget? myRightChild, myLeftChild, myTitle;
  late final double myFontSize;
  late final FontWeight myFontWeight;
  late final bool isEnable;
  final FocusNode? focus;

  VzButton({
    required this.onPressedFunc,
    this.myTitle,
    this.myTextColor = VzColor.textPrimaryLight,
    this.myBackgroundColor = VzColor.redVizeo,
    this.myHoveredColor = VzColor.redVizeo,
    this.myRadius = 55.0,
    this.myPadding = const EdgeInsets.all(8.0),
    this.myIconPadding = const EdgeInsets.all(8.0),
    this.myRightChild,
    this.myLeftChild,
    this.myFontSize = 15,
    this.myFontWeight = FontWeight.normal,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
  });

  VzButton.typePrimary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor = VzColor.redVizeo,
    this.myHoveredColor = VzColor.redVizeoSoft,
    this.myTextColor = VzColor.textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myLeftChild,
    this.myRightChild,
    this.myRadius = 55.0,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
  });

  VzButton.typeSecondary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor = VzColor.secondaryButton,
    this.myHoveredColor = VzColor.secondaryButtonSoft,
    this.myTextColor = VzColor.textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myRadius = 55.0,
    this.myLeftChild,
    this.myRightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
  });

  VzButton.typeTertiary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor = Colors.transparent,
    this.myHoveredColor = VzColor.transparent,
    this.myTextColor = VzColor.redVizeo,
    this.myPadding = EdgeInsets.zero,
    this.myIconPadding = const EdgeInsets.only(left: 8),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.myFontSize = 14,
    this.myFontWeight = FontWeight.w400,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
  });

  VzButton.typeSmall({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor = VzColor.secondaryButton,
    this.myHoveredColor = VzColor.secondaryButtonSoft,
    this.myTextColor = VzColor.textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myRadius = 55.0,
    this.myLeftChild,
    this.myRightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
  });

  @override
  _VzButtonState createState() => _VzButtonState();

  ElevatedButton getMyButton() => getMyButton();
}

class _VzButtonState extends State<VzButton> {
  bool hasFocus = false;
  late ElevatedButton _button;

  ElevatedButton getMyButton() {
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

  List<Widget> maListChild() {
    final List<Widget> listChild = [];
    if (widget.myLeftChild != null) {
      listChild.add(widget.myLeftChild!);
      listChild.add(Padding(
        padding: widget.myIconPadding,
      ));
    }
    if (widget.myTitle != null) {
      listChild.add(widget.myTitle!);
    }
    if (widget.myRightChild != null) {
      listChild.add(Padding(
        padding: widget.myIconPadding,
      ));
      listChild.add(widget.myRightChild!);
    }
    return listChild;
  }

  ButtonStyle myStyleConfig() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return widget.isEnable ? widget.myBackgroundColor : VzColor.secondaryButton.withOpacity(0.3);
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
          return widget.isEnable ? widget.myBackgroundColor : Colors.transparent;
        }
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable ? widget.myHoveredColor : Colors.transparent;
        }
        if (states.contains(MaterialState.hovered)) {
          return widget.isEnable ? widget.myHoveredColor : Colors.transparent;
        }
        return Colors.transparent;
      }),

      /// style du text suivant les etats
      textStyle: MaterialStateProperty.resolveWith((states) {
        return TextStyle(
            color: widget.isEnable ? widget.myTextColor : widget.myTextColor.withOpacity(0.3),
            fontSize: widget.myFontSize,
            fontWeight: widget.myFontWeight,
            fontFamily: myFontFamily);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _button = ElevatedButton(
      onPressed: widget.onPressedFunc,

      ///-----Background du bouton
      style: myStyleConfig(),
      focusNode: widget.focus,
      child: Padding(
        padding: widget.myPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: maListChild(),
        ),
      ),
    );
  }
}
