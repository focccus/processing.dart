import 'package:processing.dart/processing.dart';

void spider() {
  stroke(0);
  final amount = 200;
  double lastX = 0;
  double lastY = random(height);
  for (var i = 0; i < amount; i++) {
    int direction = random(0, 4);
    double x = 0;
    double y = 0;

    if (direction == 0 && lastX != 0) {
      y = random(height);
    } else if (direction == 1 && lastY != 0) {
      x = random(width);
    } else if (direction == 2 && lastY != height) {
      y = height;
      x = random(width);
    } else if (direction == 3 && lastX != width) {
      x = width;
      y = random(height);
    } else {
      i--;
      continue;
    }
    line(lastX, lastY, x, y);
    lastX = x;
    lastY = y;
  }
}
