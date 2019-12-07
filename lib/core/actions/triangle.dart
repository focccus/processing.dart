import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class TriangleAction extends CanvasAction with FillableAction, StrokeAction {
  Offset p1;
  Offset p2;
  Offset p3;

  TriangleAction(
    this.p1,
    this.p2,
    this.p3,
    Color fill,
    Color stroke,
    double strokeWidth,
  ) {
    this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  draw(Canvas c) {
    Path p = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..close();

    if (stroke != null) {
      c.drawPath(p, strokePaint);
    }
    if (fill != null) {
      c.drawPath(p, fillPaint);
    }
  }
}
