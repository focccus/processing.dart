import 'dart:ui';

import 'package:processing.dart/core/actions.dart';
import 'package:processing.dart/core/get_color.dart';

createCanvas(double w, double h) {
  c_actions.canvas = Size(w, h);
}

background(dynamic r, [int g, int b, int o]) {
  c_actions.background = getColor(r, g, b, o);
  c_actions.clear();
}
