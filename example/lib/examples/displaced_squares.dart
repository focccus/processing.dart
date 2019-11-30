import 'package:processing.dart/processing.dart';

void displacedSquares() {
  final step = width / random(5, 15);
  final double offset = random(4, 10);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  for (double x = step; x < width - 1; x += step) {
    for (double y = step; y < height - 1; y += step) {
      square(
        x + random(-offset, offset),
        y + random(-offset, offset),
        step * 0.8,
      );
    }
  }
  rectMode(CORNER);
}
