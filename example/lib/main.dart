import 'package:processing.dart/processing.dart';
import 'examples/braid_crossings.dart';
import 'examples/circle_pattern.dart';
import 'examples/dot_cross_gradient.dart';
import 'examples/dot_lines.dart';
import 'examples/dotted_gradient.dart';
import 'examples/random_lines.dart';
import 'examples/rect_patterns.dart';
import 'examples/square_fractal.dart';
import 'examples/circle_packing.dart';
import 'examples/displaced_squares.dart';
import 'examples/dots.dart';
import 'examples/hexagon_patterns.dart';
import 'examples/hypnotic_circles.dart';
import 'examples/hypnotic_squares.dart';
import 'examples/irregular_squares.dart';
import 'examples/lines_totop.dart';
import 'examples/parallelism.dart';
import 'examples/random_crossing.dart';
import 'examples/random_rects.dart';
import 'examples/random_triangles.dart';
import 'examples/recursive_squares.dart';
import 'examples/rotated_lines.dart';
import 'examples/sized_dots.dart';
import 'examples/spider.dart';
import 'examples/spiral.dart';
import 'examples/square_packing.dart';
import 'examples/tiled_arcs.dart';
import 'examples/tiled_squares.dart';
import 'examples/tilted_lines.dart';
import 'examples/triangle_fractal.dart';
import 'examples/triangle_pattern.dart';
import 'examples/wall_drawing.dart';
import 'examples/joy_division.dart';

void main() => start(
      setup: setup,
      draw: draw,
      onTap: () => draw(),
    );

void setup() {
  createCanvas(800, 800);
  frameRate(60);
  noLoop();
}

void draw() {
  print("draw");
  background(255);

  push();
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
    dots,
    linesBottomTop,
    circlePacking,
    sizedDots,
    displacedSquares,
    squarePacking,
    recursiveSquares,
    spider,
    parallelism,
    randomTiltedLines,
    goldenRatioSpiral,
    tiledQuarterCircles,
    dottedGradient,
    randomLines,
    braidCrossing,
    dotCrossGradient,
    randomRectTriangles,
    randomTriangles,
    simpleHexagonPattern,
    complexHexagonPattern,
    simpleSpacedHexagonPattern,
    randomHexagonPattern,
    simpleCirclePattern,
    randomCirclePattern,
    spacedCirclePattern,
    spacedHexagonPattern,
    squareFractal,
    triangleFractal,
    joyDivision,
    randomCrossing,
    dotsAndLines,
    irregularSquares,
    rectLines,
    rectPattern,
    trianglePattern,
  ])();
  pop();
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
  polygon(0, 0, 100, 6);
}
