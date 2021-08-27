import 'package:flutter/material.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/vz_strings.dart';

enum _TypeButton { PRIMARY, SECONDARY, TERTIARY, SMALL, NOTYPE }

class VzButton extends StatefulWidget {
  late final String? myTitle, myFont;
  late final VoidCallback? onPressedFunc;
  Color? myBackgroundColor, myHoveredColor, myTextColor;
  late final double myRadius;
  late final EdgeInsets myPadding;
  late final EdgeInsets myIconPadding;
  final Widget? myRightChild, myLeftChild;
  late final double myFontSize;
  late final FontWeight myFontWeight;
  late final bool isEnable;
  final FocusNode? focus;
  late final _TypeButton type;

  VzButton({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.redVizeo,
    this.myTextColor = VzColor.textPrimaryLight,
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

  VzButton.typePrimary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.redVizeoSoft,
    this.myTextColor = VzColor.textOnRedVizeo,
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

  VzButton.typeSecondary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.secondaryButtonSoft,
    this.myTextColor = VzColor.textOnRedVizeo,
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

  VzButton.typeTertiary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.transparent,
    this.myTextColor = VzColor.textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 8),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
    this.isEnable = true,
    this.focus,
    this.type = _TypeButton.TERTIARY,
  });

  VzButton.typeSmall({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.secondaryButtonSoft,
    this.myTextColor = VzColor.textOnRedVizeo,
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
  _VzButtonState createState() => _VzButtonState();

  Container getMyButton() => getMyButton();
}

class _VzButtonState extends State<VzButton> {
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

  List<Widget> maListChild() {
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
        style: TextStyle(color: widget.myTextColor),
      ));
    }
    if (widget.myRightChild != null) {
      listChild.add(Padding(
        padding: widget.myIconPadding,
      ));
      listChild.add(widget.myRightChild!);
    }
    return listChild;
  }

  ButtonStyle myStyleConfig(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (widget.type == _TypeButton.PRIMARY) {
          return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.SECONDARY) {
          return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.TERTIARY) {
          return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.SMALL) {
          return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
        }

        return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
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
                  color: widget.myBackgroundColor!,
                )
              : null;
        }
      }),

      /// style du fond suivant les etats
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          if (widget.type == _TypeButton.PRIMARY) {
            return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.SECONDARY) {
            return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.TERTIARY) {
            return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
          }
          if (widget.type == _TypeButton.SMALL) {
            return widget.isEnable ? widget.myBackgroundColor! : widget.myBackgroundColor!.withOpacity(0.3);
          }
        }
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable ? VzColor.white.withOpacity(0.15) : Colors.transparent;
        }
        if (states.contains(MaterialState.hovered)) {
          return widget.isEnable ? VzColor.white.withOpacity(0.15) : Colors.transparent;
        }
        return Colors.transparent;
      }),

      /// style du text suivant les etats
      textStyle: MaterialStateProperty.resolveWith((states) {
        return TextStyle(
            color: widget.isEnable ? widget.myTextColor : widget.myTextColor!.withOpacity(0.3),
            fontSize: widget.myFontSize,
            fontWeight: widget.myFontWeight,
            fontFamily: myFontFamily);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == _TypeButton.PRIMARY) {
      widget.myBackgroundColor = VzColor.redVizeo;
    }
    if (widget.type == _TypeButton.SECONDARY) {
      widget.myBackgroundColor = VzColor.secondaryButtonColor(context: context);
    }
    if (widget.type == _TypeButton.TERTIARY) {
      widget.myBackgroundColor = VzColor.tertiaryButtonColor(context: context);
    }
    if (widget.type == _TypeButton.SMALL) {
      widget.myBackgroundColor = VzColor.secondaryButtonColor(context: context);
    }
    return _button = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: widget.myBackgroundColor!,
        ),
        color: widget.myBackgroundColor,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressedFunc,

        ///-----Background du bouton
        style: myStyleConfig(context),
        focusNode: widget.focus,
        child: Padding(
          padding: widget.myPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: maListChild(),
          ),
        ),
      ),
    );
  }
}
