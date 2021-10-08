import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizeo_theme/private/constants_value.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/regex_utils.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class VzTextForm extends StatefulWidget {
  final TextEditingController? controller;
  final double? width;
  final TextInputAction? textInputAction;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  late final TextInputType keyboardType;
  final String? Function(String?)? validator;
  late final bool isEnable;
  final String? hint;
  final FocusNode? focus;
  late final TextAlign textAlign;
  Function(PointerEnterEvent)? callbackOnEnter;
  Function(PointerExitEvent)? callbackOnExit;
  bool isPassword = false;
  bool _isEyeEnable = false;
  late final VzTextFormType _vzTextFormType;

  VzTextForm({
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hint,
    this.focus,
    this.width,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
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
    this.focus,
    this.width,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
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
    this.focus,
    this.width,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
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
    this.hint = "Téléphone",
    this.focus,
    this.width,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
  }) : super() {
    _vzTextFormType = VzTextFormType.telephone;
  }

  @override
  _MyTextForm createState() => _MyTextForm();
  TextFormField getMyField() => getMyField();
}

class _MyTextForm extends State<VzTextForm> {
  late TextFormField _myField;
  final _formKey = GlobalKey<FormState>();
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
        debugPrint("is Email => $isEmail");
        //TODO override error if wrong mail
        break;
      case VzTextFormType.password:
        //TODO password check
        final isGoodLegnthPwd = GetUtils.isLengthGreaterOrEqual(txt, 8);
        final isOneCapitalize = regexUppercase(txt);
        final isOneNumber = regexNumber(txt);
        final isNotAlphaNumeric = !regexAlphaNumeric(txt);

        debugPrint(
            "is Good Pwd => ${isGoodLegnthPwd && isOneCapitalize && isOneNumber && isNotAlphaNumeric}");
        break;
      case VzTextFormType.telephone:
        final isPhone = GetUtils.isPhoneNumber(txt);
        debugPrint("is Phone => $isPhone");
        //TODO override error if wrong phone
        break;
      case VzTextFormType.general:
        break;
      default:
        debugPrint(
            "Euh La y a un gros souci => sorti des 4 valeurs de l'enum VzTextFormType");
    }
  }

  @override
  Widget build(BuildContext context) {
    _myField = TextFormField(
      autocorrect: false,
      obscuringCharacter: "*",
      enabled: widget.isEnable,
      style: vzThemeLight().textTheme.bodyText1,
      obscureText: widget.isPassword,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign,
      onChanged: (txt) {
        _analyseTextInForm(txt);
        widget.onChanged!(txt);
      },
      onFieldSubmitted: (txt) {
        _analyseTextInForm(txt);
        widget.onFieldSubmitted!(txt);
      },
      keyboardType: widget.keyboardType,
      focusNode: widget.focus,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint,
      ),
    );

    return AnimatedContainer(
      width: widget.width ?? MediaQuery.of(context).size.width,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 150),
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ConstantValue.borderRadiusTextForm),
          ),
        ),
        color: widget.isEnable
            ? VzColor.backgroundSecondaryLight
            : VzColor.backgroundSecondaryLight.withOpacity(0.8),
      ),
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
                            : print("error");
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
