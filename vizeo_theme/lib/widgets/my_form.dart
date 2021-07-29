part of '../vizeo_theme.dart';

//TODO validator, completer comportement de typePassword, definir une taille, textinputaction, onfieldsubmited

class MyTextForm extends StatefulWidget {
  MyTextForm({
    required this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.myKeyboardType = TextInputType.text,
    this.validator,
    String? myHint,
    this.focus,
    Key? key,
  }) : super(key: key) {
    this.myHint = myHint!;
  }

  late TextEditingController controller;
  late TextInputAction? textInputAction;
  late void Function(String)? onFieldSubmitted;
  late TextInputType myKeyboardType;
  late String? Function(String?)? validator;
  late String myHint;
  late FocusNode? focus;
  late bool _isMail = false;
  late bool _isPassword = false;
  late bool _isTel = false;

  MyTextForm.typeMail({
    required this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.myKeyboardType = TextInputType.emailAddress,
    this.validator,
    this.myHint = "Mail",
    this.focus,
    Key? key,
  }) : super(key: key) {
    _isMail = true;
  }

  MyTextForm.typePassword({
    required this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.myKeyboardType = TextInputType.text,
    this.validator,
    this.myHint = "Password",
    this.focus,
    Key? key,
  }) : super(key: key) {
    _isPassword = true;
  }

  MyTextForm.typeTelNumber({
    required this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.myKeyboardType = TextInputType.phone,
    this.validator,
    this.myHint = "Téléphone",
    this.focus,
    Key? key,
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
    widget.focus?.addListener(() {
      if (widget.focus!.hasFocus) {
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
      style: const TextStyle(color: ColorVizeo.textPrimaryDark, fontWeight: FontWeight.w400),
      obscureText: widget._isPassword,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.myKeyboardType,
      focusNode: widget.focus,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
          hintText: widget.myHint,
          hintStyle: const TextStyle(color: ColorVizeo.textTertiaryDark),
          enabledBorder: inputBorderNormal(),
          focusedBorder: inputBorderFocused(),
          errorBorder: inputBorderErrorBorder(),
          disabledBorder: inputBorderDisabledBorder(),
          focusedErrorBorder: inputBorderFocusedErrorBorder(),
          errorStyle: const TextStyle(color: ColorVizeo.redVizeo)),
    );

    return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(38.0),
            ),
          ),
          color: hasFocus ? ColorVizeo.backgroundTertiaryDark : ColorVizeo.backgroundSecondaryDark,
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
        color: ColorVizeo.redVizeo,
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
        color: ColorVizeo.redVizeo,
      ),
    );
  }
}
