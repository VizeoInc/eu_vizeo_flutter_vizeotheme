part of '../vizeo_theme.dart';

class MyElevatedButton extends StatefulWidget {
  MyElevatedButton({
    required this.myTitle,
    required this.onPressedFunc,
    required this.focus,
    this.myBackgroundColor = redVizeo,
    this.myHoveredColor = redVizeo,
    this.myTextColor = textPrimaryLight,
    this.myPadding = const EdgeInsets.all(8.0),
    this.myIconPadding = const EdgeInsets.all(8.0),
    this.myFontSize = 15,
    this.myLeftChild,
    this.myRightChild,
    this.myFontWeight = FontWeight.normal,
    this.myFont = myFontFamily,
    this.isEnable = true,
  });
  late VoidCallback? onPressedFunc;
  late String myTitle, myFont;
  late Color myBackgroundColor, myHoveredColor, myTextColor;
  late EdgeInsets myPadding;
  late EdgeInsets myIconPadding;
  late double myFontSize;
  late FontWeight myFontWeight;
  Widget? myRightChild, myLeftChild;
  bool isEnable = true;
  late FocusNode focus;

  MyElevatedButton.typePrimary({
    required this.myTitle,
    required this.onPressedFunc,
    required this.focus,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.myBackgroundColor = redVizeo,
    this.myHoveredColor = redVizeoSoft,
    this.myTextColor = textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
  });

  MyElevatedButton.typeSecondary({
    required this.myTitle,
    required this.onPressedFunc,
    required this.focus,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.myBackgroundColor = secondaryButton,
    this.myHoveredColor = secondaryButtonSoft,
    this.myTextColor = textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
  });

  MyElevatedButton.typeTertiary({
    required this.myTitle,
    required this.onPressedFunc,
    required this.focus,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.myBackgroundColor = Colors.transparent,
    this.myHoveredColor = Colors.transparent,
    this.myTextColor = redVizeo,
    this.myPadding = EdgeInsets.zero,
    this.myIconPadding = const EdgeInsets.only(left: 8),
    this.myFontSize = 14,
    this.myFontWeight = FontWeight.w400,
    this.myFont = myFontFamily,
  });

  MyElevatedButton.typeSmall({
    required this.myTitle,
    required this.onPressedFunc,
    required this.focus,
    this.myLeftChild,
    this.myRightChild,
    this.isEnable = true,
    this.myBackgroundColor = secondaryButton,
    this.myHoveredColor = secondaryButtonSoft,
    this.myTextColor = textOnRedVizeo,
    this.myPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.myIconPadding = const EdgeInsets.only(left: 12),
    this.myFontSize = 18,
    this.myFontWeight = FontWeight.w700,
    this.myFont = myFontFamily,
  });

  @override
  _MyElevatedButtonState createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    // change value has focus when user click on TextField
    widget.focus.addListener(() {
      if (widget.focus.hasFocus) {
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
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return widget.isEnable
            ? widget.myBackgroundColor
            : secondaryButton.withOpacity(0.3);
      }),

      ///-----Shadow du bouton
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0))),
      shadowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
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
          return widget.isEnable
              ? widget.myBackgroundColor
              : Colors.transparent;
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
        if (states.contains(MaterialState.pressed)) {
          return TextStyle(
              color: widget.isEnable
                  ? widget.myTextColor
                  : widget.myTextColor.withOpacity(0.3),
              fontSize: widget.myFontSize,
              fontWeight: widget.myFontWeight,
              fontFamily: myFontFamily);
        }
        if (states.contains(MaterialState.focused)) {
          return TextStyle(
              color: widget.isEnable
                  ? widget.myTextColor
                  : widget.myTextColor.withOpacity(0.3),
              fontSize: widget.myFontSize,
              fontWeight: widget.myFontWeight,
              fontFamily: myFontFamily);
        }
        if (states.contains(MaterialState.hovered)) {
          return TextStyle(
              color: widget.isEnable
                  ? widget.myTextColor
                  : widget.myTextColor.withOpacity(0.3),
              fontSize: widget.myFontSize,
              fontWeight: widget.myFontWeight,
              fontFamily: myFontFamily);
        }

        return TextStyle(
            color: widget.isEnable
                ? widget.myTextColor
                : widget.myTextColor.withOpacity(0.3),
            fontSize: widget.myFontSize,
            fontWeight: widget.myFontWeight,
            fontFamily: myFontFamily);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, //TODO
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
