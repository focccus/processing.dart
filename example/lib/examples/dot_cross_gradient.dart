import 'package:processing.dart/processing.dart';

void dotCrossGradient() {
  final step = width / (random(10, 40) * 1.2);
  final dir = random(-1, 1);

  for (double i = 0; i < width; i += step * 1.2) {
    for (double j = 0; j < height; j += step * 1.2) {
      bool isCross = random() * j / height > 0.2;
      var o = (i / width * 150 + 55).round();
      if (dir < 0) o = 255 - o;
      fill(0, 0, 0, o);
      if (isCross) {
        square(i, j + step / 3, step / 3);
        rect(i + step / 3, j, step / 3, step);
        square(i + step - step / 3, j + step / 3, step / 3);
      } else {
        circle(i + step / 2, j + step / 2, step / 2);
      }
    }
  }
}
