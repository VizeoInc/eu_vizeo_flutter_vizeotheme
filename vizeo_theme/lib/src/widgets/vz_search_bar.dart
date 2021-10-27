import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/widgets/vz_box_customisation.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class VzSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final TextInputAction? textInputAction;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChanged;
  late final TextInputType keyboardType;
  final String? Function(String?)? validator;
  late final bool isEnable;
  final String? hint;
  final FocusNode? focus;
  late final TextAlign textAlign;
  final TextStyle? style;
  final Key? key;

  VzSearchBar({
    required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hint,
    this.focus,
    this.width,
    this.height = 40.0,
    this.style,
    this.textAlign = TextAlign.start,
    this.isEnable = true,
    this.key,
  }) : super();

  @override
  _MyVzSearchBar createState() => _MyVzSearchBar();
}

class _MyVzSearchBar extends State<VzSearchBar> {
  late TextFormField _myField;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _myField = TextFormField(
      key: widget.key,
      autocorrect: false,
      obscuringCharacter: "*",
      enabled: widget.isEnable,
      style: widget.style ?? vzThemeLight().textTheme.bodyText1,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign,
      onChanged: (txt) {
        if (widget.onChanged != null) {
          widget.onChanged!(txt);
        }
      },
      onFieldSubmitted: (txt) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(txt);
        }
      },
      keyboardType: widget.keyboardType,
      focusNode: widget.focus,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.style ?? vzThemeLight().textTheme.bodyText1,
      ),
    );

    return AnimatedContainer(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 150),
      decoration: VzBox.vzBoxDecoration(),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          _myField,
          Positioned(
            child: IconButton(
              icon: const Icon(Icons.search_outlined),
              color: VzColor.backgroundTertiaryDark,
              onPressed: () {
                final text = widget.controller?.text;
                if (text != null) {
                  widget.onFieldSubmitted!(text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
