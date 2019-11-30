import 'dart:math';
import 'dart:ui';

import 'package:processing.dart/canvas/constants.dart';
import 'package:processing.dart/core/actions.dart';
import 'package:processing.dart/core/actions/transform.dart';
import 'package:processing.dart/core/get_color.dart';

void frameRate(int framerate) {
  c_actions.framerate = framerate;
}

dynamic random([dynamic from, num to]) {
  var rng = new Random();

  if (from == null) return rng.nextDouble();

  if (from is bool) return rng.nextBool();

  if (from is num && to == null) {
    if (from <= 0) return 0;
    if (from is int) {
      return rng.nextInt(from);
    }
    return rng.nextDouble() * from;
  }
  if (from is num && to != null) {
    if (to - from <= 0) return 0;
    if (from is int && to is int) {
      return rng.nextInt(to - from) + from;
    }
    return rng.nextDouble() * (to - from) + from;
  }
  if (from is List) {
    final i = rng.nextInt(from.length);
    return from[i];
  }
}

void loop() {
  c_actions.doLoop = true;
}

void noLoop() {
  c_actions.doLoop = false;
}

void fill(dynamic r, [int g, int b, int o]) {
  c_actions.fillColor = getColor(r, g, b, o);
}

void noFill() {
  c_actions.fillColor = null;
}

void stroke(dynamic r, [int g, int b, int o]) {
  c_actions.strokeColor = getColor(r, g, b, o);
}

void strokeWeight(double weight) {
  c_actions.strokeWidth = weight;
}

void rectMode(ShapePosition mode) {
  c_actions.rectMode = mode;
}

void ellipseMode(ShapePosition mode) {
  c_actions.ellipseMode = mode;
}

void angleMode(AngleMode mode) {
  c_actions.angleMode = mode;
}

void rotate(double angle) {
  var a = RotateAction(
    c_actions.angleMode == AngleMode.RADIANS ? angle : angle * pi / 180,
  );
  c_actions.add(a);
}

void translate(double dx, double dy) {
  var a = TranslateAction(
    Offset(dx, dy),
  );
  c_actions.add(a);
}
