import 'dart:ui';

import 'package:processing.dart/core/actions.dart';

class RotateAction extends CanvasAction {
  double angle;

  RotateAction(this.angle);

  draw(Canvas c) {
    c.rotate(angle);
  }
}

class TranslateAction extends CanvasAction {
  Offset offset;

  TranslateAction(this.offset);

  draw(Canvas c) {
    c.translate(offset.dx, offset.dy);
  }
}
