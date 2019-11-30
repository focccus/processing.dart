import 'package:processing.dart/processing.dart';
import 'examples/circle_packing.dart';
import 'examples/displaced_squares.dart';
import 'examples/dots.dart';
import 'examples/hypnotic_circles.dart';
import 'examples/hypnotic_squares.dart';
import 'examples/lines_totop.dart';
import 'examples/random_rects.dart';
import 'examples/recursive_squares.dart';
import 'examples/sized_dots.dart';
import 'examples/spiral.dart';
import 'examples/square_packing.dart';
import 'examples/tiled_arcs.dart';
import 'examples/tiled_squares.dart';
import 'examples/tilted_lines.dart';
import 'examples/wall_drawing.dart';

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
  print("draw");
  background(255);

  random([
    wallDrawing,
    randomRects,
    tiledSquares,
    tiledArcs,
    hypnoticSquares,
    hypnoticCircles,
    tiltedLines,
    tiltedMultiLinesConfused,
    tiltedMultiLines,
    spiral,
    circleLines,
    dots,
    linesBottomTop,
    circlePacking,
    sizedDots,
    displacedSquares,
    squarePacking,
    recursiveSquares,
  ])();
  noFill();
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
