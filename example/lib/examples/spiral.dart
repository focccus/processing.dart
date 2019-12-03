import 'dart:math';

import 'package:processing.dart/processing.dart';

void spiral() {
  final spread = random(0.01, 0.5);
  translate(width / 2, height / 2);
  for (int i = 1;
      i < sqrt(pow(width, 2) + pow(height, 2)) * 1 / (spread * 2);
      i++) {
    rotate(TWO_PI / 180);
    fill(0, 0, 0, random(50, 255));
    circle(i * spread, 0, 1);
  }
}

void goldenRatioSpiral() {
  final spread = random(0.05, 1.0);
  translate(width / 2, height / 2);
  for (double i = 1;
      i < sqrt(pow(width, 2) + pow(height, 2)) * 5;
      i += spread) {
    rotate(TWO_PI * GRATIO);
    fill(random(0, 200));
    circle(i, 0, 1);
  }
}
