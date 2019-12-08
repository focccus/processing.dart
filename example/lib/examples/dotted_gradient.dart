import 'package:processing.dart/processing.dart';

void dottedGradient() {
  final step = width / random(20, 100);
  final dir = random(-1, 2) + random(-1, 2);
  print(dir);
  strokeWeight(step);
  for (double i = 0; i < width; i += step) {
    for (double j = 0; j < height; j += step) {
      var color = (i / width * 200 + 55).round();
      var o = (j / height * 200 + 55).round();
      if (dir < 0) color = 255 - color;
      if (dir > 0) o = 255 - o;
      stroke(color, color, color, o);
      point(i + step / 2, j + step / 2);
    }
  }
}
