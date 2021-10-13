import 'package:flutter/material.dart';
import 'package:vizeo_theme/src/widgets/vz_item_draggable.dart';

class VzDropTargetList extends StatefulWidget {
  late List<Widget> list;
  late double? height;
  late double? width;
  late Color? backgroundColor;
  late void Function(VzItemDraggable)? onAccept;
  late bool Function(VzItemDraggable?)? onWillAccept;
  late void Function(DragTargetDetails<VzItemDraggable>)? onAcceptWithDetails;
  late void Function(VzItemDraggable?)? onLeave;

  VzDropTargetList({
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
  _VzDropTargetList createState() => _VzDropTargetList();

  Container getVzDropTargetList() => getVzDropTargetList();
}

class _VzDropTargetList extends State<VzDropTargetList> {
  late Container _vzDropTargetList;

  Container getVzDropTargetList() {
    return _vzDropTargetList;
  }

  @override
  Widget build(BuildContext context) {
    return _vzDropTargetList = Container(
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
            child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (BuildContext context, int index) {
                return widget.list[index];
              },
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
