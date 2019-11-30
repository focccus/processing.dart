import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class CircleAction extends CanvasAction with FillableAction, StrokeAction {
  Offset offset;
  double radius;

  CircleAction(
    this.offset,
    this.radius,
    Color fill,
    Color stroke,
    double strokeWidth,
  ) {
    this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  draw(Canvas c) {
    if (fill != null) {
      c.drawCircle(offset, radius, fillPaint);
    }
    if (stroke != null) {
      c.drawCircle(offset, radius, strokePaint);
    }
  }
}
