import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class EllipseAction extends CanvasAction with FillableAction, StrokeAction {
  Rect box;

  EllipseAction(
    this.box,
    Color fill,
    Color stroke,
    double strokeWidth,
  ) {
    this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  double get radius => box.width / 2;
  Offset get offset => box.center;

  draw(Canvas c) {
    if (fill != null) {
      c.drawOval(box, fillPaint);
    }
    if (stroke != null) {
      c.drawOval(box, strokePaint);
    }
  }
}
