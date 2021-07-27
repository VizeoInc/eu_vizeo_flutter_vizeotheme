part of '../vizeo_theme.dart';

class MyChip extends StatefulWidget {
  MyChip({
    required this.myLabel,
    this.myBackgroundColor = backgroundTertiaryDark,
    this.myPadding = const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
  });

  late final Widget myLabel;
  late final Color myBackgroundColor;
  late final EdgeInsets myPadding;

  @override
  _MyChip createState() => _MyChip();
}

class _MyChip extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: widget.myBackgroundColor,
      padding: widget.myPadding,
      avatar: const CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          'AB',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      label: widget.myLabel,
    );
  }
}
