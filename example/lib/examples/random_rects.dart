import 'package:processing.dart/processing.dart';

void randomRects() {
  final rectCount = 20;
  translate(width / 2, height / 2);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(0);
  for (var i = 0; i < rectCount; i++) {
    rect(
      (random() * 2 - 1) * width / 3,
      (random() * 2 - 1) * height / 3,
      random() * width / 2,
      random() * height / 2,
    );
  }
  // rect(-100, 0, width / 2, height);
  rectMode(CORNER);
}
