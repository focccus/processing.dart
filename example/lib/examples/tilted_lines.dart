import 'dart:math';

import 'package:processing.dart/processing.dart';

void tiltedLines() {
  stroke(0);
  strokeWeight(2);

  final int step = random(10, 40);

  drawLine(double x, double y, double w, double h) {
    if (random(true)) {
      line(x, y, x + w, y + h);
    } else {
      line(x + w, y, x, y + h);
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step.toDouble(), step.toDouble());
    }
  }
}

void tiltedMultiLines() {
  stroke(0);
  strokeWeight(1);

  final int step = random(30, 100);

  drawLine(double x, double y, double w, double h, double d) {
    final bool o = random(true);

    for (double i = 0; i < h; i += d) {
      if (o) {
        line(x, y + i, x + w - i, y + h);

        line(x + i, y, x + w, y + h - i);
      } else {
        line(x, y + h - i, x + w - i, y);

        line(x + i, y + h, x + w, y + i);
      }
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step.toDouble(), step.toDouble(), step.toDouble() / 4);
    }
  }
}

void tiltedMultiLinesConfused() {
  stroke(0);
  strokeWeight(2);

  final int step = random(10, 40);

  drawLine(double x, double y, double w, double h, double d) {
    if (random(true)) {
      //line(x, y + d, x + w, y + h + d);
      for (double i = -h; i < h; i += d) {
        line(x, y + i, x + w, y + i + h);
      }
    } else {
      for (double i = -h; i < h; i += d) {
        line(x + w, y + i, x, y + i + h);
      }
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step.toDouble(), step.toDouble(), 20);
    }
  }
}

void randomTiltedLines() {
  stroke(0);
  strokeWeight(2);

  final double step = width / random(10, 50);
  final linewidth = sqrt(2 * pow(step, 2));

  drawLine(double x, double y, double w, double h) {
    if (random(true)) {
      double offset = random(w / 2);

      line(x + w / 2 - offset, y, x + w / 2 + offset, y + h);
    } else {
      double offset = random(1, h / 2);

      line(x, y + h / 2 - offset, x + w, y + h / 2 + offset);
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step, step);
    }
  }
}
