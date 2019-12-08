import 'dart:ui';

import 'package:processing.dart/canvas/constants.dart';
import 'package:processing.dart/core/styles.dart';

abstract class CanvasAction {
  void draw(Canvas canvas);
}

int selectedActions = 0;

List<CanvasActions> _actionsList = [];

CanvasActions get c_actions => _actionsList[selectedActions];

int get c_actionsamount => _actionsList.length;
void addActions() {
  _actionsList.add(CanvasActions());
  selectedActions = _actionsList.length - 1;
}

class CanvasActions {
  Size canvas = Size.zero;
  List<CanvasAction> _actions = [];
  List<CanvasAction> get actions => _actions;

  CanvasStyles style = CanvasStyles();
  List<CanvasStyles> savedStyles = [];

  int framerate = 30;
  bool doLoop = true;
  AngleMode angleMode = AngleMode.RADIANS;

  Color background = Color(0xffffffff);

  void add(CanvasAction a) {
    _actions.add(a);
  }

  void clear() {
    _actions = [];
  }
}

mixin FillableAction {
  Color fill;

  Paint get fillPaint => Paint()
    ..style = PaintingStyle.fill
    ..color = fill;
}
mixin StrokeAction {
  Color stroke;
  double strokeWidth;

  Paint get strokePaint => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = stroke;
}
