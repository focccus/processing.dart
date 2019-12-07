import 'dart:math';
import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class PolygonAction extends CanvasAction with FillableAction, StrokeAction {
  Rect box;
  int n;

  PolygonAction(
    this.box,
    this.n,
    Color fill,
    Color stroke,
    double strokeWidth,
  ) : assert(n > 2, "A regular polygon must have atleast the edge number 3") {
    this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  double get radius => box.width / 2;
  Offset get offset => box.center;

  draw(Canvas c) {
    Path p = Path()..moveTo(offset.dx + radius, offset.dy);

    for (var i = 1; i < n; i++) {
      double angle = 2 * pi * (i / n);
      double x = offset.dx + radius * cos(angle);
      double y = offset.dy + radius * sin(angle);
      p.lineTo(x, y);
    }
    p.close();

    if (stroke != null) {
      c.drawPath(p, strokePaint);
    }
    if (fill != null) {
      c.drawPath(p, fillPaint);
    }
  }
}
