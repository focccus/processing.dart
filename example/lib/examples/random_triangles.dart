import 'package:processing.dart/processing.dart';

void randomTriangles() {
  final count = random(10, 50);
  strokeWeight(2);

  final marginX = width * 0.05;
  final marginY = height * 0.05;
  for (var i = 0; i < count; i++) {
    push();
    random(true) ? stroke(0, 0, 0, random(200)) : fill(0, 0, 0, random(200));
    triangle(
      random(marginX, width - marginX),
      random(marginY, height - marginY),
      random(marginX, width - marginX),
      random(marginY, height - marginY),
      random(marginX, width - marginX),
      random(marginY, height - marginY),
    );
    pop();
  }
}

void randomRectTriangles() {
  final count = random(20, 50);
  strokeWeight(2);

  final marginX = width * 0.05;
  final marginY = height * 0.05;
  for (var i = 0; i < count; i++) {
    double x = random(marginX, width - marginX);
    double y = random(marginY, height - marginY);
    fill(0, 0, 0, random(150));
    triangle(
      x,
      y,
      x,
      y + random(-height / 2, height / 2),
      x + random(-width / 2, width / 2),
      y,
    );
  }
}
