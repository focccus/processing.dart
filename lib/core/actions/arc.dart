import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class ArcAction extends CanvasAction with FillableAction, StrokeAction {
  Rect rect;
  double start;
  double end;
  bool isClosed = true;

  ArcAction(
    this.rect,
    this.start,
    this.end,
    Color fill,
    Color stroke,
    double strokeWidth,
    this.isClosed,
  ) {
    this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  draw(Canvas c) {
    if (fill != null) {
      c.drawArc(rect, start, end, isClosed, fillPaint);
    }
    if (stroke != null) {
      c.drawArc(rect, start, end, isClosed, strokePaint);
    }
  }
}
