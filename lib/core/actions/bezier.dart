import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class BezierAction extends CanvasAction with StrokeAction {
  Offset p1;
  Offset p2;
  Offset c1;
  Offset c2;

  BezierAction(
    this.p1,
    this.p2,
    this.c1,
    this.c2,
    Color stroke,
    double strokeWidth,
  ) {
    // this.fill = fill;
    this.stroke = stroke;
    this.strokeWidth = strokeWidth;
  }

  draw(Canvas c) {
    Path p = Path()..moveTo(p1.dx, p1.dy);
    if (c2 != null) {
      p.cubicTo(p2.dx, p2.dy, c1.dx, c1.dy, c2.dx, c2.dy);
    } else {
      p.quadraticBezierTo(p2.dx, p2.dy, c1.dx, c1.dy);
    }

    if (stroke != null) {
      c.drawPath(p, strokePaint);
    }
  }
}
