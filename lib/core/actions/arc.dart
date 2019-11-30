import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class ArcAction extends CanvasAction with FillableAction, StrokeAction {
  Rect rect;
  double start;
  double end;

  ArcAction(
    this.rect,
    this.start,
    this.end,
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
      c.drawArc(rect, start, end, true, fillPaint);
    }
    if (stroke != null) {
      c.drawArc(rect, start, end, true, strokePaint);
    }
  }
}
