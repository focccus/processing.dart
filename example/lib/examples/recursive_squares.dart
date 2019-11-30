import 'package:processing.dart/processing.dart';

void recursiveSquares() {
  final maxTries = 4;
  stroke(0);

  void drawSquare(double x, double y, double w, int step) {
    square(x, y, w);
    if (step >= 0) {
      double newX = x + 0.03 * w;
      double newY = y + 0.03 * w;
      double newW = w * 0.88;
      if (random(true)) {
        drawSquare(newX, newY, newW / 2, step - 1);
      }
      if (random(true)) {
        drawSquare(newX, newY + w / 2, newW / 2, step - 1);
      }
      if (random(true)) {
        drawSquare(newX + w / 2, newY + w / 2, newW / 2, step - 1);
      }
      if (random(true)) {
        drawSquare(newX + w / 2, newY, newW / 2, step - 1);
      }
    }
  }

  drawSquare(10, 10, width - 20, maxTries);
}
