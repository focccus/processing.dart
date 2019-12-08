import 'package:processing.dart/processing.dart';

void rectLines() {
  final minWidth = width / 10;
  final maxWidth = width / 5;

  double counter = 0;

  while (counter < width) {
    fill(0, 0, 0, random(0, 150));

    final r = random(minWidth, maxWidth);

    rect(counter, 0, counter + r, height);

    counter += r;
  }
}

void rectPattern() {
  final r = random(10, 40);
  final step = width / (r % 2 == 0 ? r + 1 : r);
  stroke(0, 0, 0, random(0, 200));

  bool prev = false;

  for (double j = 0; j < height; j += step) {
    for (double i = 0; i < width; i += step) {
      if (prev) {
        rect(i, j, i + step, j + step / 2);
        rect(i, j + step / 2, i + step, j + step);
      } else {
        rect(i, j, i + step / 2, j + step);
        rect(i + step / 2, j, i + step, j + step);
      }
      prev = !prev;
    }
  }
}
