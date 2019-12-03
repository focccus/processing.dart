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
  c_actions.style.fillColor = getColor(r, g, b, o);
}

void noFill() {
  c_actions.style.fillColor = null;
}

void stroke(dynamic r, [int g, int b, int o]) {
  c_actions.style.strokeColor = getColor(r, g, b, o);
}

void strokeWeight(double weight) {
  c_actions.style.strokeWidth = weight;
}

void rectMode(ShapePosition mode) {
  c_actions.style.rectMode = mode;
}

void ellipseMode(ShapePosition mode) {
  c_actions.style.ellipseMode = mode;
}

void angleMode(AngleMode mode) {
  c_actions.angleMode = mode;
}

void rotate(double angle) {
  var a = c_actions.angleMode == AngleMode.RADIANS ? angle : angle * pi / 180;
  c_actions.add(RotateAction(a));
  c_actions.style.rotation = a;
}

void translate(double dx, double dy) {
  var a = Offset(dx, dy);
  c_actions.add(TranslateAction(a));
  c_actions.style.translate = a;
}

void push() {
  c_actions.savedStyle = c_actions.style.copy();
}

void pop() {
  if (c_actions.style.translate != c_actions.savedStyle.translate) {
    c_actions.add(
      TranslateAction(
        c_actions.savedStyle.translate - c_actions.style.translate,
      ),
    );
  }
  if (c_actions.style.rotation != c_actions.savedStyle.rotation) {
    c_actions.add(
      RotateAction(c_actions.savedStyle.rotation - c_actions.style.rotation),
    );
  }
  c_actions.style = c_actions.savedStyle.copy();
}
