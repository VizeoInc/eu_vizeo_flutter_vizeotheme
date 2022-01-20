import 'package:flutter/material.dart';
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
  late double? hintSize;
  final Key? key;
  final bool isReadOnly;

  VzSearchBar({
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
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        VzTextForm(
          controller: widget.controller,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          hint: widget.hint ?? "Recherche...",
          hintSize: widget.hintSize,
          focus: widget.focus,
          width: widget.width,
          height: widget.height,
          style: widget.style,
          textAlign: widget.textAlign,
          isEnable: widget.isEnable,
          isReadOnly: widget.isReadOnly,
        ),
        Positioned(
          child: IconButton(
            icon: const Icon(Icons.search_outlined),
            color: VzColor.accentLight,
            onPressed: () {
              final text = widget.controller?.text;
              if (text != null) {
                widget.onFieldSubmitted!(text);
              }
            },
          ),
        ),
      ],
    );
  }
}
