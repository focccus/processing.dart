import 'dart:math' as m;
import 'dart:ui';

import 'package:processing.dart/canvas/constants.dart';
import 'package:processing.dart/core/actions.dart';
import 'package:processing.dart/core/actions/transform.dart';
import 'package:processing.dart/core/get_color.dart';

void frameRate(int framerate) {
  c_actions.framerate = framerate;
}

dynamic random([dynamic from, num to]) {
  var rng = new m.Random();

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
  var a = c_actions.angleMode == AngleMode.RADIANS ? angle : angle * PI / 180;
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

T max<T extends num>(dynamic n1, [T n2, T n3, T n4]) {
  List<T> numbers = [];
  if (n1 is List<T>)
    numbers = n1;
  else if (n1 is T) {
    numbers.add(n1);
    if (n2 != null) numbers.add(n2);
    if (n3 != null) numbers.add(n3);
    if (n4 != null) numbers.add(n4);
  } else
    throw ("Please insert either a list of numbers or the induvidual numbers");

  num max = 0;

  numbers.forEach((T n) {
    if (n > max) max = n;
  });
  return (max as T);
}

T min<T extends num>(dynamic n1, [T n2, T n3, T n4]) {
  List<T> numbers = [];
  if (n1 is List<T>)
    numbers = n1;
  else if (n1 is T) {
    numbers.add(n1);
    if (n2 != null) numbers.add(n2);
    if (n3 != null) numbers.add(n3);
    if (n4 != null) numbers.add(n4);
  } else
    throw ("Please insert either a list of numbers or the induvidual numbers");

  T min;

  numbers.forEach((T n) {
    if (min == null) min = n;
    if (n < min) min = n;
  });
  return min;
}

T abs<T extends num>(T n) => n.abs();
