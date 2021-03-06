import 'package:processing.dart/processing.dart';

void sizedDots() {
  final step = width / random(10, 40);
  for (double i = 0; i < width; i += step) {
    for (double j = 0; j < height; j += step) {
      fill(random(0, 200));
      circle(i + step / 2, j + step / 2, random(0, step / 1.8));
    }
  }
}
