import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizeo_theme/private/constants_value.dart';
import 'package:vizeo_theme/private/enum.dart';
import 'package:vizeo_theme/private/regex_utils.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class VzTextForm extends StatefulWidget {
  late final TextEditingController? controller;
  late final double? width;
  late final TextInputAction? textInputAction;
  late void Function(String)? onFieldSubmitted;
  late final TextInputType keyboardType;
  late final String? Function(String?)? validator;
  late final bool isEnable;
  late final String? hint;
  late final FocusNode? focus;
  Function(PointerEnterEvent)? callbackOnEnter;
  Function(PointerExitEvent)? callbackOnExit;
  bool isPassword = false;
  bool _isEyeEnable = false;
  late final VzTextFormType _vzTextFormType;

  VzTextForm({
    required this.controller,
    required this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hint,
    this.focus,
    this.width,
    this.isEnable = true,
  }) : super() {
    _vzTextFormType = VzTextFormType.GENERAL;
  }

  VzTextForm.typeMail({
    required this.controller,
    required this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType = TextInputType.emailAddress,
    this.validator,
    this.hint = "Mail",
    this.focus,
    this.width,
    this.isEnable = true,
  }) : super() {
    _vzTextFormType = VzTextFormType.MAIL;
  }

  VzTextForm.typePassword({
    required this.controller,
    required this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hint = "Mot de Passe",
    this.focus,
    this.width,
    this.isEnable = true,
  }) : super() {
    isPassword = true;
    _vzTextFormType = VzTextFormType.PASSWORD;
  }

  VzTextForm.typeTelNumber({
    required this.controller,
    required this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType = TextInputType.phone,
    this.validator,
    this.hint = "Téléphone",
    this.focus,
    this.width,
    this.isEnable = true,
  }) : super() {
    _vzTextFormType = VzTextFormType.TELEPHONE;
  }

  @override
  _MyTextForm createState() => _MyTextForm();
  TextFormField getMyField() => getMyField();
}

class _MyTextForm extends State<VzTextForm> {
  late Form _myField;
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

  Form getMyField() {
    return _myField;
  }

  @override
  Widget build(BuildContext context) {
    _myField = Form(
      key: _formKey,
      child: TextFormField(
        autocorrect: false,
        obscuringCharacter: "*",
        enabled: widget.isEnable,
        style: Theme.of(context).textTheme.bodyText1,
        obscureText: widget.isPassword,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: (txt) {
          switch (widget._vzTextFormType) {
            case VzTextFormType.MAIL:
              final isEmail = GetUtils.isEmail(txt);
              debugPrint("is Email => $isEmail");
              //TODO override error if wrong mail
              break;
            case VzTextFormType.PASSWORD:
              //TODO password check
              final isGoodLegnthPwd = GetUtils.isLengthGreaterOrEqual(txt, 8);
              final isOneCapitalize = regexUppercase(txt);
              final isOneNumber = regexNumber(txt);
              final isNotAlphaNumeric = !regexAlphaNumeric(txt);

              debugPrint("is Good Pwd => ${isGoodLegnthPwd && isOneCapitalize && isOneNumber && isNotAlphaNumeric}");
              break;
            case VzTextFormType.TELEPHONE:
              final isPhone = GetUtils.isPhoneNumber(txt);
              debugPrint("is Phone => $isPhone");
              //TODO override error if wrong phone
              break;
            case VzTextFormType.GENERAL:
              break;
            default:
              debugPrint("Euh La y a un gros souci => sorti des 4 valeurs de l'enum VzTextFormType");
          }
          widget.onFieldSubmitted!(txt);
        },
        keyboardType: widget.keyboardType,
        focusNode: widget.focus,
        controller: widget.controller,
        validator: (value) {
          // TODO made validator
          widget.validator!(value);
        },
        decoration: InputDecoration(
          hintText: widget.hint,
        ),
      ),
    );

    return AnimatedContainer(
      width: widget.width ?? MediaQuery.of(context).size.width,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 150),
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ConstantValue.borderRadiusTextForm),
          ),
        ),
        color: VzColor.backgroundSecondaryLight,
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          _myField,
          widget._vzTextFormType == VzTextFormType.PASSWORD
              ? Positioned(
                  child: MouseRegion(
                    onEnter: (event) {
                      widget._isEyeEnable = true;
                    },
                    onExit: (exit) {
                      widget._isEyeEnable = false;
                    },
                    child: IconButton(
                      icon: widget.isPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
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
