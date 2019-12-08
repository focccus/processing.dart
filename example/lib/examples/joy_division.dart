import 'package:processing.dart/processing.dart';

void joyDivision() {
  final step = width / random(20, 50);
  stroke(0);

  for (double i = step * 2; i <= height; i += step) {
    double prevY = i.toDouble();
    for (double j = 0; j <= width; j += step) {
      var distanceToCenter = abs(j - width / 2);
      var variance = max<double>(width / 2 - 50 - distanceToCenter, 0);
      var randomV = random() * variance / 4 * -1;
      bezier(
        j,
        prevY,
        j + step / 2,
        prevY,
        j + step / 2,
        i + randomV,
        j + step,
        i + randomV,
      );
      prevY = i + randomV;
    }
  }
}
