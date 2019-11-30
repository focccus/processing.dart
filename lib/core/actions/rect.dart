import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class RectAction extends CanvasAction with FillableAction, StrokeAction {
  Rect rect;

  RectAction(this.rect, Color fill, Color stroke, double strokeWidth) {
    this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  draw(Canvas c) {
    if (fill != null) {
      c.drawRect(rect, fillPaint);
    }
    if (stroke != null) {
      c.drawRect(rect, strokePaint);
    }
  }
}
