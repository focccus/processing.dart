import 'dart:math';

import 'package:processing.dart/core/actions.dart';

double get width => c_actions.canvas.width;
double get height => c_actions.canvas.height;

AngleMode get RADIANS => AngleMode.RADIANS;
AngleMode get DEGREES => AngleMode.DEGREES;

ShapePosition get CORNER => ShapePosition.CORNER;
ShapePosition get CORNERS => ShapePosition.CORNERS;
ShapePosition get RADIUS => ShapePosition.RADIUS;
ShapePosition get CENTER => ShapePosition.CENTER;

double get PI => pi;
double get HALF_PI => pi / 2;
double get QUARTER_PI => pi / 4;
double get TWO_PI => pi * 2;

enum ShapePosition {
  CORNER,
  CORNERS,
  RADIUS,
  CENTER,
}
enum AngleMode {
  RADIANS,
  DEGREES,
}
