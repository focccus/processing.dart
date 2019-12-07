import 'dart:math';

import 'package:processing.dart/processing.dart';

_drawhex(double x, double y, double r) {
  polygon(x, y, r, 6);
  polygon(x + 1.5 * r, y + 0.8675 * r, r, 6);
}

void simpleHexagonPattern() {
  final step = width / random(10, 50);

  stroke(0);
  ellipseMode(CORNER);

  for (double i = -step; i < width; i += step * 3) {
    for (double j = -step; j < height; j += step * 1.735) {
      _drawhex(i, j, step);
    }
  }
}

void randomHexagonPattern() {
  final step = width / random(10, 50);

  ellipseMode(CORNER);

  for (double i = -step; i < width; i += step * 3) {
    for (double j = -step; j < height; j += step * 1.735) {
      push();
      random(true)
          ? stroke(0, 0, 0, random(20, 200))
          : fill(0, 0, 0, random(20, 200));
      _drawhex(i, j, step);
      pop();
    }
  }
}

void spacedHexagonPattern() {
  final step = width / random(5, 30);
  final padding = random(0.1, 1.1);

  ellipseMode(CORNER);

  void drawHex(double x, double y, double r) {
    polygon(x, y, r / (2 + padding), 6);
    polygon(x + r * cos(PI / 3), y + r * sin(PI / 3), r / (2 + padding), 6);
  }

  for (double i = -2 * step; i < width; i += step) {
    for (double j = -2 * step; j < height; j += step * 2 * sin(PI / 3)) {
      fill(0, 0, 0, random(20, 200));
      drawHex(i, j, step);
    }
  }
  //drawcircle(0, 0, 100);
}
