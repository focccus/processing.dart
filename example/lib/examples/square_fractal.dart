import 'dart:math';

import 'package:processing.dart/processing.dart';

void squareFractal() {
  final int interations = random(2, 7);

  translate(width / 2, height / 2);

  fill(0, 0, 0, 200);

  rectMode(CENTER);
  void drawSqr(double x, double y, double w, int i) {
    square(x, y, w);

    final newW = w / 2;

    if (i > 0) {
      for (var j = 0; j < 4; j++) {
        fill(0, 0, 0, random(10, 150));
        if (random() < i / interations) {
          drawSqr(
            x - (w + newW) / 2 + newW * j,
            y + (w + newW) / 2,
            newW * 0.9,
            i - 1,
          );
        }
        if (random() < i / interations) {
          drawSqr(
            x - (w + newW) / 2 + newW * j,
            y - (w + newW) / 2,
            newW * 0.9,
            i - 1,
          );
        }
      }
    }
  }

  drawSqr(0, 0, random(width / 3.5, width / 2.8), interations);
}
