import 'package:processing.dart/processing.dart';

void linesBottomTop() {
  for (var j = 0; j < 10; j++) {
    for (double i = 0; i < width; i += 3) {
      final b = random(50);
      strokeWeight(random(3));
      stroke(0, 0, 0, b);
      line(
        i,
        height,
        i,
        random(height),
      );
    }
  }
}
