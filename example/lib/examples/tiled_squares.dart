import 'package:processing.dart/processing.dart';

void tiledSquares() {
  final double step = width / random(5, 10);

  void drawSquare(double x, double y, double w, int step) {
    if (random(true)) {
      stroke(0, 0, 0, random([100, 150, 200]));
      strokeWeight(random(0, step.toDouble() + 1));
      square(x, y, w);
    }

    if (step > 0) {
      final dS = w / step;
      drawSquare(x + dS / 2, y + dS / 2, w - dS, step - 1);
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      stroke(0);
      strokeWeight(1);
      square(x + 2, y + 2, step - 4);
      drawSquare(x + 10, y + 10, step - 20, 6);
    }
  }
}
