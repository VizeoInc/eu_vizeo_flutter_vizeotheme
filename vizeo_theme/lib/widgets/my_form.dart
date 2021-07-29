part of '../vizeo_theme.dart';

//TODO validator, completer comportement de typePassword, definir une taille

class MyTextForm extends StatefulWidget {
  MyTextForm({
    required this.focus,
    required this.controller,
    this.myKeyboardType = TextInputType.text,
    this.validator,
    String? myHint,
    Key? key,
  }) : super(key: key) {
    this.myHint = myHint!;
  }

  late FocusNode focus;
  late TextEditingController controller;
  late TextInputType myKeyboardType;
  late String? Function(String?)? validator;
  late String myHint;
  late bool _isMail = false;
  late bool _isPassword = false;
  late bool _isTel = false;

  MyTextForm.typeMail({
    required this.focus,
    this.myHint = "Mail",
    Key? key,
  }) : super(key: key) {
    myKeyboardType = TextInputType.emailAddress;
    _isMail = true;
  }

  MyTextForm.typePassword({
    required this.focus,
    this.myHint = "Password",
    Key? key,
  }) : super(key: key) {
    myKeyboardType = TextInputType.text;
    _isPassword = true;
  }

  MyTextForm.typeTelNumber({
    required this.focus,
    this.myHint = "Téléphone",
    Key? key,
  }) : super(key: key) {
    myKeyboardType = TextInputType.phone;
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
      keyboardType: widget.myKeyboardType,
      focusNode: widget.focus,
      controller: widget.controller,
      validator: widget.validator,
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
