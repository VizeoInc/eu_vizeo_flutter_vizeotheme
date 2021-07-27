part of '../vizeo_theme.dart';

class MyTextForm extends StatefulWidget {
  MyTextForm({
    required this.focus,
    Key? key,
    String? myHint,
    //this.validator,
  }) : super(key: key) {
    this.myHint = myHint!;
  }

  late Color myBackgroundColor;
  late String myHint;
  late bool _isMail = false;
  late bool _isPassword = false;
  late bool _isTel = false;
  late FocusNode focus;
  //StringCallback? validator;

  MyTextForm.typeMail({
    required this.focus,
    Key? key,
    this.myHint = "Mail",
  }) : super(key: key) {
    _isMail = true;
  }

  MyTextForm.typePassword({
    required this.focus,
    Key? key,
    this.myHint = "Password",
  }) : super(key: key) {
    _isPassword = true;
  }

  MyTextForm.typeTelNumber({
    required this.focus,
    Key? key,
    this.myHint = "Téléphone",
  }) : super(key: key) {
    _isTel = true;
  }

  @override
  _MyTextForm createState() => _MyTextForm();
  TextFormField getMyField() => getMyField();
}

class _MyTextForm extends State<MyTextForm> {
  late TextFormField _myField;
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

  TextFormField getMyField() {
    return _myField;
  }

  @override
  Widget build(BuildContext context) {
    _myField = TextFormField(
      autocorrect: false,
      style: const TextStyle(color: textPrimaryDark, fontWeight: FontWeight.w400),
      obscureText: widget._isPassword,
      focusNode: widget.focus,
      //validator: widget.validator,
      decoration: InputDecoration(
          hintText: widget.myHint,
          hintStyle: const TextStyle(color: textTertiaryDark),
          enabledBorder: inputBorderNormal(),
          focusedBorder: inputBorderFocused(),
          errorBorder: inputBorderErrorBorder(),
          disabledBorder: inputBorderDisabledBorder(),
          focusedErrorBorder: inputBorderFocusedErrorBorder(),
          errorStyle: const TextStyle(color: redVizeo)),
    );

    return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(38.0),
            ),
          ),
          color: hasFocus ? backgroundTertiaryDark : backgroundSecondaryDark,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            _myField,
          ],
        ));
  }

  InputBorder inputBorderNormal() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(38.0),
      ),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  InputBorder inputBorderFocused() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(38.0),
      ),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }

  InputBorder inputBorderErrorBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(38.0),
      ),
      borderSide: BorderSide(
        color: redVizeo,
      ),
    );
  }

  InputBorder inputBorderDisabledBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(38.0),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 0.5,
      ),
    );
  }

  InputBorder inputBorderFocusedErrorBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(38.0),
      ),
      borderSide: BorderSide(
        color: redVizeo,
      ),
    );
  }
}
