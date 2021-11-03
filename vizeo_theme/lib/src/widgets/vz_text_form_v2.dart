
import 'package:flutter/material.dart';

class VzTextFormV2 extends StatefulWidget {
  VzTextFormV2({
    required this.onSubmitted,
    Key? key,
  }) : super(key: key);
  final ValueChanged<String> onSubmitted;

  @override
  _VzTextFormV2State createState() => _VzTextFormV2State();
}

class _VzTextFormV2State extends State<VzTextFormV2> {
  final _controller = TextEditingController();
  bool _isSubmitted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return "Ne peut pas être vide";
    }
    return null;
  }

  void _submit() {
    setState(() => _isSubmitted = true);
    if (_errorText == null) {
      widget.onSubmitted(_controller.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, TextEditingValue value, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                errorText: _isSubmitted ? _errorText : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
            ElevatedButton(
              onPressed: _controller.value.text.isNotEmpty ? _submit : null,
              child: Text(
                'Submit',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        );
      },
    );
  }
}
