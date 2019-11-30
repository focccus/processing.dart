import 'package:flutter/material.dart';
import 'package:processing.dart/widgets/c_page.dart';

start({
  SetupFunction setup,
  DrawFunction draw,
  GestureTapCallback onTap,
  GestureTapUpCallback onTapUp,
  GestureTapDownCallback onTapDown,
}) {
  runApp(MaterialApp(
    home: CanvasPage(
      setup: setup,
      draw: draw,
      onTap: onTap,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
    ),
  ));
}

typedef void SetupFunction();
typedef void DrawFunction();
