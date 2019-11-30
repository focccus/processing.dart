import 'dart:ui';

import 'package:processing.dart/processing.dart';

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
