import 'dart:math';
import 'dart:ui';

import 'package:processing.dart/core/actions/circle.dart';
import 'package:processing.dart/processing.dart';

void main() => start(
      setup: setup,
      draw: draw,
      onTap: () => draw(),
    );

void setup() {
  createCanvas(400, 400);
  frameRate(60);
  noLoop();
}

void draw() {
  background(255);

  //for (var i = 0; i < random(1, 3); i++) {
  //   random([
  //     wallDrawing,
  //     randomRects,
  //     tiledSquares,
  //     tiledArcs,
  //     hypnoticSquares,
  //     hypnoticCircles,
  //     tiltedLines,
  //     tiltedMultiLinesConfused,
  //     tiltedMultiLines,
  //     spiral,
  //     circleLines,
  //     dots,
  //     linesBottomTop,
  //     circlePacking,
  //   ])();
  //   noFill();
  // }
  squarePacking();
}

void displacedSquares() {
  final step = width / random(5, 15);
  final double offset = random(4, 10);
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  for (double x = step; x < width - 1; x += step) {
    for (double y = step; y < height - 1; y += step) {
      square(
        x + random(-offset, offset),
        y + random(-offset, offset),
        step * 0.8,
      );
    }
  }
  rectMode(CORNER);
}

void recursiveSquares() {
  final maxTries = 4;
  stroke(0);

  void drawSquare(double x, double y, double w, int step) {
    square(x, y, w);
    if (step >= 0) {
      double newX = x + 0.03 * w;
      double newY = y + 0.03 * w;
      double newW = w * 0.88;
      if (random(true)) {
        drawSquare(newX, newY, newW / 2, step - 1);
      }
      if (random(true)) {
        drawSquare(newX, newY + w / 2, newW / 2, step - 1);
      }
      if (random(true)) {
        drawSquare(newX + w / 2, newY + w / 2, newW / 2, step - 1);
      }
      if (random(true)) {
        drawSquare(newX + w / 2, newY, newW / 2, step - 1);
      }
    }
  }

  drawSquare(10, 10, width - 20, maxTries);
}

void wallDrawing() {
  final int lines = random(5, 12);
  stroke(0);
  strokeWeight(width * 0.002);

  for (double i = 0; i < height; i += height / lines) {
    line(0, i, width, i);
  }
  for (double i = 0; i < width; i += width / lines) {
    line(i, 0, i, height);
  }
  final circleRStep = width / lines / 2;
  for (double i = width / 2 + circleRStep; i > 0; i -= circleRStep) {
    circle(0, 0, i);
    circle(0, height, i);
    circle(width, height, i);
    circle(width, 0, i);
    circle(width / 2, height / 2, i);
  }
}

void randomRects() {
  final rectCount = 20;
  translate(width / 2, height / 2);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(0);
  for (var i = 0; i < rectCount; i++) {
    rect(
      (random() * 2 - 1) * width / 3,
      (random() * 2 - 1) * height / 3,
      random() * width / 2,
      random() * height / 2,
    );
  }
  // rect(-100, 0, width / 2, height);
  rectMode(CORNER);
}

void tiledSquares() {
  final double step = width / random(5, 10);

  void drawSquare(double x, double y, double w, int step) {
    if (random(true)) {
      stroke(0, 0, 0, random([100, 150, 200]));
      strokeWeight(random(0, step.toDouble() + 1));
      square(x, y, w);
    }

    if (step > 0) {
      final dS = w / step;
      drawSquare(x + dS / 2, y + dS / 2, w - dS, step - 1);
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      stroke(0);
      strokeWeight(1);
      square(x + 2, y + 2, step - 4);
      drawSquare(x + 10, y + 10, step - 20, 6);
    }
  }
}

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

void hypnoticSquares() {
  final finalSize = random(5, 10);
  final startSize = width / random(5, 15);
  final startSteps = random(3, 5);

  stroke(0);
  strokeWeight(2);

  void drawSquare(
    double x,
    double y,
    double w,
    double h,
    double dx,
    double dy,
    int steps,
  ) {
    rect(x, y, w, h);

    if (steps >= 0) {
      var newSize = startSize * (steps / startSteps) + finalSize;
      var nX = x + (w - newSize) / 2;
      var nY = y + (h - newSize) / 2;
      nX = nX - ((x - nX) / (steps + 2)) * dx;
      nY = nY - ((y - nY) / (steps + 2)) * dy;
      drawSquare(nX, nY, newSize, newSize, dx, dy, steps - 1);
    }
  }

  for (double x = 0; x < width; x += startSize) {
    for (double y = 0; y < height; y += startSize) {
      drawSquare(
        x,
        y,
        startSize,
        startSize,
        random() * 2 - 1,
        random() * 2 - 1,
        startSteps - 1,
      );
    }
  }
}

void hypnoticCircles() {
  final finalSize = random(5, 10);
  final startSize = width / random(5, 15);
  final startSteps = random(3, 5);

  stroke(0);
  strokeWeight(2);

  void drawCircle(
    double x,
    double y,
    double r,
    double dx,
    double dy,
    int steps,
  ) {
    circle(x, y, r);

    if (steps >= 0) {
      var newSize =
          (startSize / 2 - finalSize) * (steps / startSteps) + finalSize;
      var nX = x - (newSize * dx) / (steps + 4);
      var nY = y - (newSize * dy) / (steps + 4);
      drawCircle(nX, nY, newSize, dx, dy, steps - 1);
    }
  }

  for (double x = 0; x < width; x += startSize) {
    for (double y = 0; y < height; y += startSize) {
      drawCircle(
        x + startSize / 2,
        y + startSize / 2,
        startSize / 2,
        random() * 2 - 1,
        random() * 2 - 1,
        startSteps - 1,
      );
    }
  }
}

void tiltedLines() {
  stroke(0);
  strokeWeight(2);

  final int step = random(10, 40);

  drawLine(double x, double y, double w, double h) {
    if (random(true)) {
      line(x, y, x + w, y + h);
    } else {
      line(x + w, y, x, y + h);
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step.toDouble(), step.toDouble());
    }
  }
}

void tiltedMultiLinesConfused() {
  stroke(0);
  strokeWeight(2);

  final int step = random(10, 40);

  drawLine(double x, double y, double w, double h, double d) {
    if (random(true)) {
      //line(x, y + d, x + w, y + h + d);
      for (double i = -h; i < h; i += d) {
        line(x, y + i, x + w, y + i + h);
      }
    } else {
      for (double i = -h; i < h; i += d) {
        line(x + w, y + i, x, y + i + h);
      }
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step.toDouble(), step.toDouble(), 20);
    }
  }
  //drawLine(0, 0, width, height, 100);
}

void tiltedMultiLines() {
  stroke(0);
  strokeWeight(1);

  final int step = random(30, 100);

  drawLine(double x, double y, double w, double h, double d) {
    final bool o = random(true);
    //line(x, y + d, x + w, y + h + d);
    // for (double i = -h; i < h; i += d) {
    //   var overY1 = y - i;
    //   var overY2 = y + i + h;

    //   if (o) {
    //     line(
    //       overY1 > 0 ? x + overY1 : x,
    //       overY1 > 0 ? y : y + i,
    //       overY2 > h ? x + overY2 : x + w,
    //       overY2 > h ? y + h : y + i + h,
    //     );
    //   } else {
    //     line(
    //       overY2 > h ? x - w + overY2 : x,
    //       overY2 > h ? y + h : y + h + i,
    //       overY1 > 0 ? x + w - overY1 : x + w,
    //       overY1 > 0 ? y : y + i,
    //     );
    //   }
    // }
    // } else {
    //   for (double i = -h; i < h; i += d) {
    //     line(x + w, y + i, x, y + i + h);
    //   }
    // }

    for (double i = 0; i < h; i += d) {
      if (o) {
        line(x, y + i, x + w - i, y + h);

        line(x + i, y, x + w, y + h - i);
      } else {
        line(x, y + h - i, x + w - i, y);

        line(x + i, y + h, x + w, y + i);
      }
    }
  }

  for (double x = 0; x < width; x += step) {
    for (double y = 0; y < height; y += step) {
      drawLine(x, y, step.toDouble(), step.toDouble(), step.toDouble() / 4);
    }
  }
  //drawLine(10, 10, width - 20, height - 20, 20);
}

void spiral() {
  translate(width / 2, height / 2);
  for (var i = 1; i < sqrt(pow(width, 2) + pow(height, 2)) * 5; i++) {
    rotate(TWO_PI / 180);
    fill(random(0, 200));
    circle(i * 0.1, 0, 1);
  }
}

void circleLines() {
  stroke(0);
  translate(width / 2, height / 2);
  final angle = TWO_PI / 6;
  for (var i = 0; i < 6; i++) {
    rotate(angle);
    line(0, 0, 100, 0);
  }
  circle(0, 0, 100);
  translate(-width / 2, -height / 2);
}

void dots() {
  var step = width / random(10, 40);
  for (double i = 0; i < width; i += step) {
    for (double j = 0; j < height; j += step) {
      fill(random(0, 200));
      circle(i + step / 2, j + step / 2, step / 5);
    }
  }
}

void sizedDots() {
  var step = width / random(10, 40);
  for (double i = 0; i < width; i += step) {
    for (double j = 0; j < height; j += step) {
      fill(random(0, 200));
      circle(i + step / 2, j + step / 2, random(0, step / 1.8));
    }
  }
}

void linesBottomTop() {
  for (var j = 0; j < 10; j++) {
    for (double i = 0; i < width; i += 3) {
      final b = random(50);
      strokeWeight(random(3));
      stroke(0, 0, 0, b);
      line(
        i,
        height,
        i,
        random(height),
      );
    }
  }
}

void circlePacking() {
  stroke(0);
  fill(0);
  List<CircleAction> circles = [];
  double minRadius = 2;
  var maxRadius = 50;
  var totalCircles = 200;
  var createCircleAttempts = 200;

  bool doesCircleHaveACollision(double x, double y, double r) {
    // Return true of false depending on whether the circle collides with another.

    for (var i = 0; i < circles.length; i++) {
      var otherCircle = circles[i];
      var a = r + otherCircle.radius;
      var mx = x - otherCircle.offset.dx;
      var my = y - otherCircle.offset.dy;

      if (a >= sqrt(mx * mx + my * my)) {
        return true;
      }
    }

    if (x + r >= width || x - r <= 0) {
      return true;
    }

    if (y + r >= height || y - r <= 0) {
      return true;
    }

    return false;
  }

  void createAndDrawCircle() {
    // Loop through from 0 to createCircleAttempts
    // trying to create a circle.

    // Once we have a circle created, grow it until
    // it hits another, or reaches max size.

    // Draw the circle
    var circleSafeToDraw = false;
    double radius, x, y;
    for (var tries = 0; tries < createCircleAttempts; tries++) {
      radius = minRadius;
      x = random(width);
      y = random(height);

      if (doesCircleHaveACollision(x, y, radius)) {
        continue;
      } else {
        circleSafeToDraw = true;
        break;
      }
    }

    if (!circleSafeToDraw) {
      print("try failed");
      return;
    }

    for (var radiusSize = minRadius; radiusSize < maxRadius; radiusSize++) {
      radius = radiusSize;
      if (doesCircleHaveACollision(x, y, radius)) {
        radius--;
        break;
      }
    }

    circles.add(circle(x, y, radius));
  }

  for (var i = 0; i < totalCircles; i++) {
    createAndDrawCircle();
  }
}

void squarePacking() {
  List<Rect> squares = [];
  double minSize = 5;
  var maxSize = 100;
  var total = 400;
  var createAttempts = 200;
  double spacing = 0;
  if (random(true)) {
    fill(0);
    spacing = random(1, 5);
  } else {
    stroke(0);
  }

  bool doesSquareHaveACollision(double x, double y, double r) {
    // Return true of false depending on whether the circle collides with another.
    final rect = Rect.fromLTWH(
        x - spacing, y - spacing, r + 2 * spacing, r + 2 * spacing);
    for (var i = 0; i < squares.length; i++) {
      var otherSquare = squares[i];
      if (otherSquare.overlaps(rect)) {
        return true;
      }
    }

    if (x + r >= width - spacing || x <= spacing) {
      return true;
    }

    if (y + r >= height - spacing || y <= spacing) {
      return true;
    }

    return false;
  }

  void createAndDrawSquare() {
    var safeToDraw = false;
    double size, x, y;
    for (var tries = 0; tries < createAttempts; tries++) {
      size = minSize;
      x = random(width);
      y = random(height);

      if (doesSquareHaveACollision(x, y, size)) {
        continue;
      } else {
        safeToDraw = true;
        break;
      }
    }

    if (!safeToDraw) {
      return;
    }

    for (var sSize = minSize; sSize < maxSize; sSize++) {
      size = sSize;
      if (doesSquareHaveACollision(x, y, size)) {
        size--;
        break;
      }
    }

    squares.add(square(x, y, size).rect);
  }

  for (var i = 0; i < total; i++) {
    createAndDrawSquare();
  }
  noFill();
}
