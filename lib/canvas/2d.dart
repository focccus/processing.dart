import 'dart:math';
import 'dart:ui';

import 'package:processing.dart/canvas/constants.dart';
import 'package:processing.dart/core/actions.dart';
import 'package:processing.dart/core/actions/arc.dart';
import 'package:processing.dart/core/actions/ellipse.dart';
import 'package:processing.dart/core/actions/line.dart';
import 'package:processing.dart/core/actions/rect.dart';

Rect _getRectWithMode(
  double x,
  double y,
  double w,
  double h,
  ShapePosition mode,
) {
  if (mode == ShapePosition.CENTER) {
    return Rect.fromCenter(center: Offset(x, y), width: w, height: h);
  }
  if (mode == ShapePosition.RADIUS) {
    return Rect.fromCenter(center: Offset(x, y), width: w * 2, height: h * 2);
  }
  if (mode == ShapePosition.CORNERS) {
    return Rect.fromLTRB(x, y, w, h);
  }
  return Rect.fromLTWH(x, y, w, h);
}

RectAction rect(double x, double y, double w, double h) {
  var a = RectAction(
    _getRectWithMode(x, y, w, h, c_actions.style.rectMode),
    c_actions.style.fillColor,
    c_actions.style.strokeColor,
    c_actions.style.strokeWidth,
  );
  c_actions.add(a);
  return a;
}

RectAction square(double x, double y, double s) {
  return rect(x, y, s, s);
}

EllipseAction circle(double x, double y, double r) {
  return ellipse(x, y, 2 * r);
}

EllipseAction ellipse(double x, double y, double w, [double h]) {
  final o = _getRectWithMode(x, y, w, h ?? w, c_actions.style.ellipseMode);
  var a = EllipseAction(
    o,
    c_actions.style.fillColor,
    c_actions.style.strokeColor,
    c_actions.style.strokeWidth,
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
    c_actions.style.fillColor,
    c_actions.style.strokeColor,
    c_actions.style.strokeWidth,
  );
  c_actions.add(a);
  return a;
}

LineAction line(double x1, double y1, double x2, double y2) {
  var a = LineAction(
    Offset(x1, y1),
    Offset(x2, y2),
    c_actions.style.strokeColor,
    c_actions.style.strokeWidth,
  );
  c_actions.add(a);
  return a;
}
