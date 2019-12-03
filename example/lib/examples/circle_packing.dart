import 'dart:math';

import 'package:processing.dart/core/actions/ellipse.dart';
import 'package:processing.dart/processing.dart';

void circlePacking() {
  random(true) ? stroke(0) : fill(0);
  List<EllipseAction> circles = [];
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
