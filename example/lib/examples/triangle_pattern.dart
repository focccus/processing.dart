import 'package:processing.dart/processing.dart';

void trianglePattern() {
  final step = width / random(10, 40);
  final hs = step / 2;
  fill(0, 0, 0, random(50, 150));

  for (double y = 0; y < height; y += step) {
    for (double x = 0; x < width; x += step) {
      triangle(x, y, x, y + hs, x + hs, y + hs);
      triangle(x + hs, y, x + step, y, x + hs, y + hs);
      triangle(x + step, y + hs, x + step, y + step, x + hs, y + hs);
      triangle(x + hs, y + step, x, y + step, x + hs, y + hs);
    }
  }
}
