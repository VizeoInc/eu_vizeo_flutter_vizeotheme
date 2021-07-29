part of '../vizeo_theme.dart';

class MyElevatedButton extends StatefulWidget {
  MyElevatedButton({
    required this.myTitle,
    required this.onPressedFunc,
    this.myTextColor = ColorVizeo.textPrimaryLight,
    this.myBackgroundColor = ColorVizeo.redVizeo,
    this.myHoveredColor = ColorVizeo.redVizeo,
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

  late String myTitle, myFont;
  late VoidCallback? onPressedFunc;
  late Color myBackgroundColor, myHoveredColor, myTextColor;
  late double myRadius;
  late EdgeInsets myPadding;
  late EdgeInsets myIconPadding;
  Widget? myRightChild, myLeftChild;
  late double myFontSize;
  late FontWeight myFontWeight;
  bool isEnable = true;
  FocusNode? focus;

  MyElevatedButton.typePrimary({
    required this.myTitle,
    required this.onPressedFunc,
    this.myBackgroundColor = ColorVizeo.redVizeo,
    this.myHoveredColor = ColorVizeo.redVizeoSoft,
    this.myTextColor = ColorVizeo.textOnRedVizeo,
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

  MyElevatedButton.typeSecondary({
    required this.myTitle,
    required this.onPressedFunc,
    this.myBackgroundColor = ColorVizeo.secondaryButton,
    this.myHoveredColor = ColorVizeo.secondaryButtonSoft,
    this.myTextColor = ColorVizeo.textOnRedVizeo,
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

  MyElevatedButton.typeTertiary({
    required this.myTitle,
    required this.onPressedFunc,
    this.myBackgroundColor = Colors.transparent,
    this.myHoveredColor = ColorVizeo.secondaryButtonSoft,
    this.myTextColor = ColorVizeo.redVizeo,
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

  MyElevatedButton.typeSmall({
    required this.myTitle,
    required this.onPressedFunc,
    this.myBackgroundColor = ColorVizeo.secondaryButton,
    this.myHoveredColor = ColorVizeo.secondaryButtonSoft,
    this.myTextColor = ColorVizeo.textOnRedVizeo,
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
  _MyElevatedButtonState createState() => _MyElevatedButtonState();

  ElevatedButton getMyButton() => getMyButton();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
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
    listChild.add(Text(
      widget.myTitle,
      style: TextStyle(color: widget.myTextColor),
    ));
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
        return widget.isEnable ? widget.myBackgroundColor : ColorVizeo.secondaryButton.withOpacity(0.3);
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
