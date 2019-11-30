import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class LineAction extends CanvasAction with StrokeAction {
  Offset p1;
  Offset p2;

  LineAction(
    this.p1,
    this.p2,
    Color stroke,
    double strokeWidth,
  ) {
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  draw(Canvas c) {
    if (stroke != null) {
      c.drawLine(p1, p2, strokePaint);
    }
  }
}
