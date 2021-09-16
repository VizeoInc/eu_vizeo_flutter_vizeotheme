import 'package:flutter/material.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/themes/vz_colors.dart';
import 'package:vizeo_theme/vizeo_theme.dart';
import 'package:vizeo_theme/private/vz_strings.dart';

enum _TypeButton {
  primary,
  secondary,
  tertiary,
  small,
  notype,
}

// TODO
// mettre une annotation pour dire que si texrtStyleCustom use alors prend le dessu sur le textStyleType
// aussi pour le text
// tout sa avant 14H
// apres bosse projet perso

class VzButton extends StatefulWidget {
  final String? myTitle;
  final VoidCallback? onPressedFunc;
  late final double myRadius;
  late final EdgeInsets myPadding;
  late final EdgeInsets myIconPadding;
  late final bool isEnable;
  late final _TypeButton type;
  late final TypeDeTextStyle textStyleBasic;
  final Widget? myRightChild, myLeftChild;
  final FocusNode? focus;
  final TextStyle? textStyleCustom;
  Color? myBackgroundColor, myHoveredColor, textColor;

  VzButton({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.redVizeo,
    this.textStyleBasic = TypeDeTextStyle.body1,
    this.myPadding = const EdgeInsets.all(8.0),
    this.myIconPadding = const EdgeInsets.all(8.0),
    this.myRightChild,
    this.myLeftChild,
    this.myRadius = 5.0,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.notype,
  });

  VzButton.typePrimary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.redVizeoSoft,
    this.textStyleBasic = TypeDeTextStyle.body1,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myLeftChild,
    this.myRightChild,
    this.myRadius = 5.0,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.primary,
  });

  VzButton.typeSecondary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.secondaryButtonSoft,
    this.textStyleBasic = TypeDeTextStyle.body1,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.secondary,
  });

  VzButton.typeTertiary({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.transparent,
    this.textStyleBasic = TypeDeTextStyle.body1,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 8),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.tertiary,
  });

  VzButton.typeSmall({
    required this.onPressedFunc,
    this.myTitle,
    this.myBackgroundColor,
    this.myHoveredColor = VzColor.secondaryButtonSoft,
    this.textStyleBasic = TypeDeTextStyle.body1,
    this.myPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myRadius = 5.0,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.small,
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
    widget.focus?.addListener(() {
      if (widget.focus!.hasFocus) {
        hasFocus = true;
      } else {
        hasFocus = false;
      }
      setState(() {});
    });
  }

  List<Widget> myListChild() {
    final List<Widget> listChild = [];
    if (widget.myLeftChild != null) {
      listChild.add(
        widget.myLeftChild!,
      );
      listChild.add(
        Padding(
          padding: widget.myIconPadding,
        ),
      );
    }
    if (widget.myTitle != null) {
      Widget? title;
      switch (widget.type) {
        case _TypeButton.primary:
          title = VzText.typePrimary(
            data: widget.myTitle!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.secondary:
          title = VzText.typeSecondary(
            data: widget.myTitle!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.tertiary:
          title = VzText.typeTertiary(
            data: widget.myTitle!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.small:
          title = VzText.typeSecondary(
            data: widget.myTitle!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.notype:
          title = Text(
            widget.myTitle!,
            style: const TextStyle(
              color: VzColor.white,
            ),
          );
          break;
        default:
      }
      listChild.add(title!);
    }
    if (widget.myRightChild != null) {
      listChild.add(
        Padding(
          padding: widget.myIconPadding,
        ),
      );
      listChild.add(
        widget.myRightChild!,
      );
    }
    return listChild;
  }

  ButtonStyle myStyleConfig(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (widget.type == _TypeButton.primary) {
          return widget.isEnable
              ? widget.myBackgroundColor!
              : widget.myBackgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.secondary) {
          return widget.isEnable
              ? widget.myBackgroundColor!
              : widget.myBackgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.tertiary) {
          return widget.isEnable
              ? widget.myBackgroundColor!
              : widget.myBackgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.small) {
          return widget.isEnable
              ? widget.myBackgroundColor!
              : widget.myBackgroundColor!.withOpacity(0.3);
        }

        return widget.isEnable
            ? widget.myBackgroundColor!
            : widget.myBackgroundColor!.withOpacity(0.3);
      }),

      ///-----Shadow du bouton
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.myRadius),
        ),
      ),
      shadowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),

      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable
              ? BorderSide(color: widget.myBackgroundColor!)
              : null;
        }
      }),

      /// style du fond suivant les etats
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            if (widget.type == _TypeButton.primary) {
              return widget.isEnable
                  ? widget.myBackgroundColor!
                  : widget.myBackgroundColor!.withOpacity(0.3);
            }
            if (widget.type == _TypeButton.secondary) {
              return widget.isEnable
                  ? widget.myBackgroundColor!
                  : widget.myBackgroundColor!.withOpacity(0.3);
            }
            if (widget.type == _TypeButton.tertiary) {
              return widget.isEnable
                  ? widget.myBackgroundColor!
                  : widget.myBackgroundColor!.withOpacity(0.3);
            }
            if (widget.type == _TypeButton.small) {
              return widget.isEnable
                  ? widget.myBackgroundColor!
                  : widget.myBackgroundColor!.withOpacity(0.3);
            }
          }
          if (states.contains(MaterialState.focused)) {
            return widget.isEnable
                ? VzColor.white.withOpacity(0.15)
                : Colors.transparent;
          }
          if (states.contains(MaterialState.hovered)) {
            return widget.isEnable
                ? VzColor.white.withOpacity(0.15)
                : Colors.transparent;
          }
          return Colors.transparent;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case _TypeButton.primary:
        widget.myBackgroundColor = VzColor.redVizeo;
        break;
      case _TypeButton.secondary:
        widget.myBackgroundColor = VzColor.secondaryButtonColor();
        break;
      case _TypeButton.tertiary:
        widget.myBackgroundColor = VzColor.tertiaryButtonColor();
        break;
      case _TypeButton.small:
        widget.myBackgroundColor = VzColor.secondaryButtonColor();
        break;
      default:
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
            children: myListChild(),
          ),
        ),
      ),
    );
  }
}
