import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/private/enum.dart';
import 'package:vizeo_theme/src/themes/vz_colors.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

enum _TypeButton {
  primary,
  secondary,
  tertiary,
  small,
  notype,
}

class VzButton extends StatefulWidget {
  final String? title;
  final VoidCallback? onPressed;
  late final double radius;
  late final EdgeInsets padding;
  late final EdgeInsets iconPadding;
  late final bool isEnable;
  late final _TypeButton type;
  late final TypeDeTextStyle textStyleBasic;
  final Widget? rightChild;
  final Widget? leftChild;
  final FocusNode? focus;
  final TextStyle? textStyleCustom;
  Color? backgroundColor;
  Color? hoveredColor;
  Color? textColor;

  VzButton.typePrimary({
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.hoveredColor = VzColor.redVizeoSoft,
    this.textStyleBasic = TypeDeTextStyle.body2,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.leftChild,
    this.rightChild,
    this.radius = 5.0,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.primary,
  });

  VzButton.typeSecondary({
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.hoveredColor = VzColor.secondaryButtonSoft,
    this.textStyleBasic = TypeDeTextStyle.body2,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.secondary,
  });

  VzButton.typeTertiary({
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.hoveredColor = VzColor.transparent,
    this.textStyleBasic = TypeDeTextStyle.body2,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 8),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
    this.isEnable = true,
    this.focus,
    this.textStyleCustom,
    this.textColor: VzColor.white,
    this.type = _TypeButton.tertiary,
  });

  VzButton.typeSmall({
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.hoveredColor = VzColor.secondaryButtonSoft,
    this.textStyleBasic = TypeDeTextStyle.body2,
    this.padding = const EdgeInsets.all(4.0),
    this.iconPadding = const EdgeInsets.only(left: 12),
    this.radius = 5.0,
    this.leftChild,
    this.rightChild,
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
    if (widget.leftChild != null) {
      listChild.add(
        widget.leftChild!,
      );
      listChild.add(
        Padding(
          padding: widget.iconPadding,
        ),
      );
    }
    if (widget.title != null) {
      Widget? title;
      switch (widget.type) {
        case _TypeButton.primary:
          title = VzText.typePrimary(
            data: widget.title!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.secondary:
          title = VzText.typeSecondary(
            data: widget.title!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.tertiary:
          title = VzText.typeTertiary(
            data: widget.title!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.small:
          title = VzText.typeSecondary(
            data: widget.title!,
            style: widget.textStyleBasic,
            textStyleCustom: widget.textStyleCustom,
            color: widget.textColor,
          );
          break;
        case _TypeButton.notype:
          title = Text(
            widget.title!,
            style: const TextStyle(
              color: VzColor.white,
            ),
          );
          break;
        default:
      }
      listChild.add(title!);
    }
    if (widget.rightChild != null) {
      listChild.add(
        Padding(
          padding: widget.iconPadding,
        ),
      );
      listChild.add(
        widget.rightChild!,
      );
    }
    return listChild;
  }

  ButtonStyle myStyleConfig(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (widget.type == _TypeButton.primary) {
          return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.secondary) {
          return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.tertiary) {
          return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
        }
        if (widget.type == _TypeButton.small) {
          return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
        }

        return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
      }),

      ///-----Shadow du bouton
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
      shadowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),

      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return widget.isEnable ? BorderSide(color: widget.backgroundColor!) : null;
        }
      }),

      /// style du fond suivant les etats
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            if (widget.type == _TypeButton.primary) {
              return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
            }
            if (widget.type == _TypeButton.secondary) {
              return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
            }
            if (widget.type == _TypeButton.tertiary) {
              return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
            }
            if (widget.type == _TypeButton.small) {
              return widget.isEnable ? widget.backgroundColor! : widget.backgroundColor!.withOpacity(0.3);
            }
          }
          if (states.contains(MaterialState.focused)) {
            return widget.isEnable ? VzColor.white.withOpacity(0.15) : Colors.transparent;
          }
          if (states.contains(MaterialState.hovered)) {
            return widget.isEnable ? VzColor.white.withOpacity(0.15) : Colors.transparent;
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
        widget.backgroundColor ??= VzColor.redVizeo;
        break;
      case _TypeButton.secondary:
        widget.backgroundColor ??= VzColor.secondaryButtonColor();
        break;
      case _TypeButton.tertiary:
        widget.backgroundColor ??= VzColor.tertiaryButtonColor();
        break;
      case _TypeButton.small:
        widget.backgroundColor ??= VzColor.secondaryButtonColor();
        break;
      default:
    }
    return _button = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: widget.backgroundColor!,
        ),
        color: widget.backgroundColor,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,

        ///-----Background du bouton
        style: myStyleConfig(context),
        focusNode: widget.focus,
        child: Padding(
          padding: widget.padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: myListChild(),
          ),
        ),
      ),
    );
  }
}
