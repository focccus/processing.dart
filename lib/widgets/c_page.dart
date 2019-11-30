import 'package:flutter/material.dart';
import 'package:processing.dart/core/start.dart';
import 'package:processing.dart/widgets/c_widget.dart';

class CanvasPage extends StatelessWidget {
  final SetupFunction setup;
  final DrawFunction draw;
  final GestureTapCallback onTap;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;

  CanvasPage({
    @required this.setup,
    @required this.draw,
    @required this.onTap,
    @required this.onTapDown,
    @required this.onTapUp,
  })  : assert(setup != null),
        assert(draw != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Center(
          child: CanvasWidget(
            setup: setup,
            draw: draw,
            onTap: onTap,
            onTapDown: onTapDown,
            onTapUp: onTapUp,
          ),
        ),
      ),
    );
  }
}
