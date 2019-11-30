import 'dart:math';

import 'package:processing.dart/processing.dart';

void spiral() {
  translate(width / 2, height / 2);
  for (var i = 1; i < sqrt(pow(width, 2) + pow(height, 2)) * 5; i++) {
    rotate(TWO_PI / 180);
    fill(random(0, 200));
    circle(i * 0.1, 0, 1);
  }
}
