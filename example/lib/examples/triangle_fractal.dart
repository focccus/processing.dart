import 'dart:math';

import 'package:processing.dart/processing.dart';

void triangleFractal() {
  final int interations = random(3, 8);

  translate(width / 2, 0);

  fill(0, 0, 0, 255);

  void drawT(double x, double y, double w, int i) {
    if (i == 0) {
      fill(0, 0, 0, random(10, 150));
      triangle(
        x,
        y,
        x + w / 2,
        y + w * sin(PI / 3),
        x - w / 2,
        y + w * sin(PI / 3),
      );
      return;
    }

    if (i > 0) {
      drawT(x, y, w / 2, i - 1);
      drawT(x - w / 4, y + w * sin(PI / 3) / 2, w / 2, i - 1);
      drawT(x + w / 4, y + w * sin(PI / 3) / 2, w / 2, i - 1);
    }
  }

  drawT(0, width * 0.05, width, interations);
}
