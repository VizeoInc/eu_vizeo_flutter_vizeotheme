import 'package:flutter/material.dart';

class VzItemDraggable extends StatefulWidget {
  late Widget child;
  late Widget? feedbackChild;
  late Widget? childWhenDragging;
  late Color? draggingColor;
  late void Function()? onDragCompleted;
  late bool rootOverlay;
  late void Function()? onDragStarted;
  late void Function(DragUpdateDetails)? onDragUpdate;
  late void Function(DraggableDetails)? onDragEnd;

  VzItemDraggable({
    required this.child,
    this.feedbackChild,
    this.childWhenDragging,
    this.draggingColor,
    this.onDragCompleted,
    this.rootOverlay = false,
    this.onDragStarted,
    this.onDragUpdate,
    this.onDragEnd,
  });

  @override
  _VzItemDraggable createState() => _VzItemDraggable();

  Widget getVzItemDraggable() => getVzItemDraggable();
}

class _VzItemDraggable extends State<VzItemDraggable> {
  late Widget _vzItemDraggable;

  Widget getVzItemDraggable() {
    return _vzItemDraggable;
  }

  @override
  Widget build(BuildContext context) {
    return _vzItemDraggable = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Draggable<Widget>(
        // Data is the value this Draggable stores.
        data: widget,
        childWhenDragging: widget.childWhenDragging,
        feedback: widget.child,
        onDragCompleted: widget.onDragCompleted,
        rootOverlay: widget.rootOverlay,
        onDragStarted: widget.onDragStarted,
        onDragUpdate: widget.onDragUpdate,
        onDragEnd: widget.onDragEnd,
        child: widget.child,
      ),
    );
  }
}
