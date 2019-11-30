import 'dart:math';
import 'dart:ui';

import 'package:processing.dart/canvas/constants.dart';
import 'package:processing.dart/core/actions.dart';
import 'package:processing.dart/core/actions/arc.dart';
import 'package:processing.dart/core/actions/circle.dart';
import 'package:processing.dart/core/actions/line.dart';
import 'package:processing.dart/core/actions/rect.dart';

RectAction rect(double x, double y, double w, double h) {
  Rect r;
  if (c_actions.rectMode == ShapePosition.CENTER) {
    r = Rect.fromCenter(center: Offset(x, y), width: w, height: h);
  } else if (c_actions.rectMode == ShapePosition.RADIUS) {
    r = Rect.fromCenter(center: Offset(x, y), width: w * 2, height: h * 2);
  } else if (c_actions.rectMode == ShapePosition.CORNERS) {
    r = Rect.fromLTRB(x, y, w, h);
  } else {
    r = Rect.fromLTWH(x, y, w, h);
  }
  var a = RectAction(
    r,
    c_actions.fillColor,
    c_actions.strokeColor,
    c_actions.strokeWidth,
  );
  c_actions.add(a);
  return a;
}

RectAction square(double x, double y, double s) {
  return rect(x, y, s, s);
}

CircleAction circle(double x, double y, double r) {
  final o = Offset(x, y);
  var a = CircleAction(
    o,
    r,
    c_actions.fillColor,
    c_actions.strokeColor,
    c_actions.strokeWidth,
  );
  c_actions.add(a);
  return a;
}

ArcAction arc(
    double x, double y, double w, double h, double start, double end) {
  final o = Rect.fromLTWH(x, y, w, h);
  var a = ArcAction(
    o,
    c_actions.angleMode == AngleMode.RADIANS ? start : start * pi / 180,
    c_actions.angleMode == AngleMode.RADIANS ? end : end * pi / 180,
    c_actions.fillColor,
    c_actions.strokeColor,
    c_actions.strokeWidth,
  );
  c_actions.add(a);
  return a;
}

LineAction line(double x1, double y1, double x2, double y2) {
  var a = LineAction(
    Offset(x1, y1),
    Offset(x2, y2),
    c_actions.strokeColor,
    c_actions.strokeWidth,
  );
  c_actions.add(a);
  return a;
}
