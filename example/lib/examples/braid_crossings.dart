import 'package:processing.dart/processing.dart';

void braidCrossing() {
  final step = width / random(4, 20);
  final double stepwidth = step / random(1.01, 3.1);
  stroke(0);

  drawCrossing(double x, double y, double w, double h) {
    push();
    translate(x, y);
    if (random(true)) {
      bezier(0, 0, 0, h / 3, w / 2.2, h / 2.1);
      bezier(w, h, w, h - h / 3, w / 1.8, h / 1.9);
      bezier(w, 0, w, h / 3, w / 2, h / 2);
      bezier(0, h, 0, h - h / 3, w / 2, h / 2);
    } else {
      bezier(0, 0, 0, h / 3, w / 2, h / 2);
      bezier(w, h, w, h - h / 3, w / 2, h / 2);
      bezier(w, 0, w, h / 3, w / 1.8, h / 2.1);
      bezier(0, h, 0, h - h / 3, w / 2.2, h / 1.9);
    }
    pop();
  }

  drawStraight(double x, double y, double w, double h) {
    line(x, y, x, y + h);
    line(x + w, y, x + w, y + h);
  }

  for (double i = step - 2 * stepwidth; i < width; i += step) {
    for (double j = 0; j < height; j += step) {
      if (random(true))
        drawCrossing(i, j, stepwidth, step);
      else
        drawStraight(i, j, stepwidth, step);
    }
  }
}
