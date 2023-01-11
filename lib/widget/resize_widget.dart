import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// @author jd

enum ResizeBorder {
  left,
  top,
  right,
  bottom,
}

/// 可动态调整组件的大小
class ResizeWidget extends StatefulWidget {
  const ResizeWidget({
    this.width,
    this.minWidth,
    this.maxWidth,
    this.height,
    this.minHeight,
    this.maxHeight,
    this.topBorder,
    this.rightBorder,
    this.bottomBorder,
    this.leftBorder,
    required this.child,
  });
  final Widget child;
  final double? width;
  final double? minWidth;
  final double? maxWidth;
  final double? height;
  final double? minHeight;
  final double? maxHeight;
  final Widget? topBorder;
  final Widget? rightBorder;
  final Widget? bottomBorder;
  final Widget? leftBorder;
  @override
  _ResizeWidgetState createState() => _ResizeWidgetState();
}

class _ResizeWidgetState extends State<ResizeWidget> {
  double? _width;
  double? _height;
  double? _minWidth;
  double? _maxWidth;
  double? _minHeight;
  double? _maxHeight;

  @override
  void initState() {
    _width = widget.width;
    _height = widget.height;
    _minWidth = widget.minWidth ?? _width;
    _maxWidth = widget.maxWidth ?? _width;
    _minHeight = widget.minHeight ?? _height;
    _maxHeight = widget.maxHeight ?? _height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hasColumn = widget.topBorder != null || widget.bottomBorder != null;
    bool hasRow = widget.leftBorder != null || widget.rightBorder != null;

    //内容
    Widget content = Container(
      width: _width,
      height: _height,
      child: widget.child,
    );

    Widget column = hasColumn
        ? Column(
            children: [
              if (widget.topBorder != null)
                _gesrueDetectorWidget(widget.topBorder, ResizeBorder.top),
              content,
              if (widget.bottomBorder != null)
                _gesrueDetectorWidget(widget.bottomBorder, ResizeBorder.bottom),
            ],
          )
        : content;

    return hasRow
        ? Row(
            children: [
              if (widget.leftBorder != null)
                _gesrueDetectorWidget(widget.leftBorder, ResizeBorder.left),
              column,
              if (widget.rightBorder != null)
                _gesrueDetectorWidget(widget.rightBorder, ResizeBorder.right),
            ],
          )
        : column;
  }

  Widget _gesrueDetectorWidget(Widget? child, ResizeBorder border) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        if (border == ResizeBorder.left || border == ResizeBorder.right) {
          double x = details.delta.dx;
          double nowWidth = _width ?? 0;
          double nowMinWidth = _minWidth ?? 0;
          double nowMaxWidth = _maxWidth ?? 0;
          _width = nowWidth + x;
          _width = max(nowMinWidth, _width ?? 0);
          _width = min(nowMaxWidth, _width ?? 0);
          setState(() {});
        } else {
          double y = details.delta.dy;
          double nowHeight = _height ?? 0;
          double nowMinHeight = _minHeight ?? 0;
          double nowMaxHeight = _maxHeight ?? 0;
          _height = nowHeight - y;
          _height = max(nowMinHeight, _height ?? 0);
          _height = min(nowMaxHeight, _height ?? 0);
          setState(() {});
        }
      },
      child: MouseRegion(
        cursor: (border == ResizeBorder.left || border == ResizeBorder.right)
            ? SystemMouseCursors.resizeColumn
            : SystemMouseCursors.resizeRow,
        onEnter: (event) {},
        onExit: (event) {
          debugPrint(event.toString());
        },
        child: child,
      ),
    );
  }
}
