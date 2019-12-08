import 'package:processing.dart/processing.dart';

void randomCrossing() {
  final step = width / random(5, 20);
  fill(0, 0, 0, random(100, 200));

  final margin = random(0.08, 0.1);

  for (double i = 0; i < height; i += step * 0.9995) {
    double prevY = i.toDouble();
    for (double j = 0; j < width; j += step * 0.9995) {
      if (random(true)) {
        rect(i + step / 3, j, step / 3, step);
        rect(
          i,
          j + step / 3,
          step / 3 - step * margin,
          step / 3,
        );
        rect(
          i + 2 * step / 3 + step * margin,
          j + step / 3,
          step / 3 - step * margin,
          step / 3,
        );
      } else {
        rect(i, j + step / 3, step, step / 3);
        rect(
          i + step / 3,
          j,
          step / 3,
          step / 3 - step * margin,
        );
        rect(
          i + step / 3,
          j + 2 * step / 3 + step * margin,
          step / 3,
          step / 3 - step * margin,
        );
      }
    }
  }
}
