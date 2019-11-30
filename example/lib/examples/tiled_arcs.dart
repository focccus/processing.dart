import 'package:processing.dart/processing.dart';

void tiledArcs() {
  final double step = width / random(5, 20);

  void drawArc(
    double x,
    double y,
    double w,
    double h,
    int type,
  ) {
    fill(0, 0, 0, random(100, 255));
    switch (type) {
      case 1:
        arc(x - w, y - h, w * 2, h * 2, 0, HALF_PI);
        break;
      case 2:
        arc(x, y - h, w * 2, h * 2, HALF_PI, HALF_PI);
        break;
      case 3:
        arc(x, y, w * 2, h * 2, PI, HALF_PI);
        break;
      case 4:
        arc(x - w, y, w * 2, h * 2, 3 * HALF_PI, HALF_PI);
        break;
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawArc(
        x,
        y,
        step,
        step,
        random(1, 5),
      );
    }
  }
}
