import 'package:processing.dart/processing.dart';

void irregularSquares() {
  final step = width / random(3, 7);
  final interations = random(1, 3);
  strokeWeight(2);
  stroke(0);

  drawSquare(double x, double y, double w, int i) {
    square(x, y, w);
    if (i <= 0 || random(true)) {
      point(x + w / 2, y + w / 2);
    } else {
      double nW = w / 2;
      drawSquare(x, y, nW, i - 1);
      drawSquare(x + nW, y, nW, i - 1);
      drawSquare(x + nW, y + nW, nW, i - 1);
      drawSquare(x, y + nW, nW, i - 1);
    }
  }

  for (double i = 0; i < width; i += step) {
    for (double j = 0; j < height; j += step) {
      drawSquare(i, j, step, interations);
    }
  }
}
