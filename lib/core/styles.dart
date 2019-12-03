import 'dart:ui';

import 'package:processing.dart/canvas/constants.dart';

class CanvasStyles {
  Color fillColor;
  Color strokeColor;
  double strokeWidth = 1;

  Offset translate = Offset.zero;
  double scale = 1;
  double rotation = 1;

  ShapePosition rectMode = ShapePosition.CORNER;
  ShapePosition ellipseMode = ShapePosition.CENTER;

  CanvasStyles copy() => CanvasStyles()
    ..fillColor = fillColor
    ..strokeColor = strokeColor
    ..translate = translate
    ..scale = scale
    ..rotation = rotation
    ..rectMode = rectMode
    ..ellipseMode = ellipseMode;
}
