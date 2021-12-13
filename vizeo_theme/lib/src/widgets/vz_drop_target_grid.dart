import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/widgets/vz_item_draggable.dart';

class VzDropTargetGrid extends StatefulWidget {
  late List<Widget> list;
  late double? height;
  late double? width;
  late Color? backgroundColor;
  late void Function(VzItemDraggable)? onAccept;
  late bool Function(VzItemDraggable?)? onWillAccept;
  late void Function(DragTargetDetails<VzItemDraggable>)? onAcceptWithDetails;
  late void Function(VzItemDraggable?)? onLeave;

  VzDropTargetGrid({
    required this.list,
    this.height,
    this.width,
    this.backgroundColor,
    this.onAccept,
    this.onWillAccept,
    this.onAcceptWithDetails,
    this.onLeave,
  });

  @override
  _VzDropTargetGrid createState() => _VzDropTargetGrid();

  Container getVzDropTargetGrid() => getVzDropTargetGrid();
}

class _VzDropTargetGrid extends State<VzDropTargetGrid> {
  late Widget _vzDropTargetGrid;

  Widget getVzDropTargetGrid() {
    return _vzDropTargetGrid;
  }

  @override
  Widget build(BuildContext context) {
    return _vzDropTargetGrid = SizedBox(
      child: DragTarget<VzItemDraggable>(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: widget.height,
            width: widget.width,
            color: widget.backgroundColor,
            child: Wrap(
              children: widget.list,
            ),
          );
        },
        onAccept: widget.onAccept,
        onWillAccept: widget.onWillAccept,
        onAcceptWithDetails: widget.onAcceptWithDetails,
        onLeave: widget.onLeave,
      ),
    );
  }
}
