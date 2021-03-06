import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizeo_theme/src/private/regex_utils.dart';
import 'package:vizeo_theme/src/widgets/vz_box_customisation.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

enum VzTextFormType {
  mail,
  password,
  telephone,
  general,
}

class VzTextForm extends StatefulWidget {
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final TextInputAction? textInputAction;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  late final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isEnable;
  final bool isReadOnly;
  final String? hint;
  late double? hintSize;
  final FocusNode? focus;
  late final TextAlign textAlign;
  Function(PointerEnterEvent)? callbackOnEnter;
  Function(PointerExitEvent)? callbackOnExit;
  bool isPassword = false;
  bool _isEyeEnable = false;
  late final VzTextFormType _vzTextFormType;
  final TextStyle? style;

  VzTextForm({
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hint,
    this.hintSize,
    this.focus,
    this.width,
    this.height = 40,
    this.style,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
    this.isReadOnly = false,
  }) : super() {
    _vzTextFormType = VzTextFormType.general;
  }

  VzTextForm.typeMail({
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType = TextInputType.emailAddress,
    this.validator,
    this.hint = "Mail",
    this.hintSize,
    this.focus,
    this.width,
    this.height = 40,
    this.style,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
    this.isReadOnly = false,
  }) : super() {
    _vzTextFormType = VzTextFormType.mail;
  }

  VzTextForm.typePassword({
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hint = "Mot de Passe",
    this.hintSize,
    this.focus,
    this.width,
    this.height = 40,
    this.style,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
    this.isReadOnly = false,
  }) : super() {
    isPassword = true;
    _vzTextFormType = VzTextFormType.password;
  }

  VzTextForm.typeTelNumber({
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType = TextInputType.phone,
    this.validator,
    this.hint = "T??l??phone",
    this.hintSize,
    this.focus,
    this.width,
    this.height = 40,
    this.style,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
    this.isReadOnly = false,
  }) : super() {
    _vzTextFormType = VzTextFormType.telephone;
  }

  @override
  _MyTextForm createState() => _MyTextForm();
  TextFormField getMyField() => getMyField();
}

class _MyTextForm extends State<VzTextForm> {
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

  void _analyseTextInForm(String txt) {
    switch (widget._vzTextFormType) {
      case VzTextFormType.mail:
        final isEmail = GetUtils.isEmail(txt);
        break;
      case VzTextFormType.password:
        final isGoodLegnthPwd = GetUtils.isLengthGreaterOrEqual(txt, 8);
        final isOneCapitalize = regexUppercase(txt);
        final isOneNumber = regexNumber(txt);
        final isNotAlphaNumeric = !regexAlphaNumeric(txt);
        break;
      case VzTextFormType.telephone:
        final isPhone = GetUtils.isPhoneNumber(txt);
        break;
      case VzTextFormType.general:
        break;
      default:
        debugPrint(
          "Euh La y a un gros souci => sorti des 4 valeurs de l'enum VzTextFormType",
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    _myField = TextFormField(
      autocorrect: false,
      obscuringCharacter: "*",
      enabled: widget.isEnable,
      style: widget.style ?? vzThemeLight().textTheme.bodyText1,
      obscureText: widget.isPassword,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign,
      onChanged: (txt) {
        if (widget.onChanged != null) {
          _analyseTextInForm(txt);
          widget.onChanged!(txt);
        }
      },
      onFieldSubmitted: (txt) {
        if (widget.onFieldSubmitted != null) {
          _analyseTextInForm(txt);
          widget.onFieldSubmitted!(txt);
        }
      },
      keyboardType: widget.keyboardType,
      focusNode: widget.focus,
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.isReadOnly,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: widget.hintSize ?? 14,
          color: VzColor.accentLight,
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: !widget.isEnable,
        fillColor: VzColor.formIncatif,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: VzColor.redVizeo,
          ),
        ),
      ),
    );

    return AnimatedContainer(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 150),
      decoration: VzBox.vzBoxDecoration(
          colorBackground: widget.isEnable ? null : VzColor.accentColor()),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          _myField,
          (widget._vzTextFormType == VzTextFormType.password) && widget.isEnable
              ? Positioned(
                  child: MouseRegion(
                    onEnter: (event) {
                      widget._isEyeEnable = true;
                    },
                    onExit: (exit) {
                      widget._isEyeEnable = false;
                    },
                    child: IconButton(
                      icon: widget.isPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      color: VzColor.redVizeo,
                      onPressed: () {
                        widget._isEyeEnable
                            ? setState(() {
                                widget.isPassword = !widget.isPassword;
                              })
                            : debugPrint("error");
                      },
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
