import 'dart:async';

import 'package:flutter/material.dart';
import 'package:processing.dart/core/actions.dart';
import 'package:processing.dart/core/start.dart';

class CanvasWidget extends StatefulWidget {
  final SetupFunction setup;
  final DrawFunction draw;
  final GestureTapCallback onTap;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;

  CanvasWidget({
    @required this.setup,
    @required this.draw,
    @required this.onTap,
    @required this.onTapDown,
    @required this.onTapUp,
  })  : assert(setup != null),
        assert(draw != null);

  @override
  _CanvasWidgetState createState() => _CanvasWidgetState();
}

class _CanvasWidgetState extends State<CanvasWidget> {
  int prevLength = 0;
  int myCanvas;
  @override
  void initState() {
    addActions();
    myCanvas = c_actionsamount - 1;
    widget.setup();
    widget.draw();
    prevLength = c_actions.actions.length;
    Timer.periodic(Duration(microseconds: 1000000 ~/ c_actions.framerate), (_) {
      if (c_actions.doLoop) {
        _setCurrentCanvas();
        widget.draw();
      }
      if (prevLength != c_actions.actions.length) {
        setState(() {
          prevLength = c_actions.actions.length;
        });
      }
    });

    super.initState();
  }

  _setCurrentCanvas() {
    selectedActions = myCanvas;
  }

  @override
  Widget build(BuildContext context) {
    selectedActions = myCanvas;
    return SizedBox(
      width: c_actions.canvas.width,
      height: c_actions.canvas.height,
      child: ClipRect(
        child: GestureDetector(
          onTap: widget.onTap != null
              ? () {
                  _setCurrentCanvas();
                  widget.onTap();
                }
              : null,
          onTapDown: widget.onTapDown != null
              ? (_) {
                  _setCurrentCanvas();
                  widget.onTapDown(_);
                }
              : null,
          onTapUp: widget.onTapUp != null
              ? (_) {
                  _setCurrentCanvas();
                  widget.onTapUp(_);
                }
              : null,
          child: CustomPaint(
            foregroundPainter: CanvasPaint(c_actions.actions),
            child: Container(color: c_actions.background),
            size: c_actions.canvas,
          ),
        ),
      ),
    );
  }
}

class CanvasPaint extends CustomPainter {
  List<CanvasAction> actions;

  CanvasPaint(this.actions);

  @override
  void paint(Canvas canvas, Size size) {
    if (actions != null)
      actions.forEach((CanvasAction a) {
        a.draw(canvas);
      });
  }

  @override
  bool shouldRepaint(CanvasPaint oldDelegate) => true;
}
