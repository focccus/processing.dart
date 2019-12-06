import 'package:processing.dart/processing.dart';

void randomLines() {
  final count = random(10, 50);
  strokeWeight(2);
  stroke(0);
  final marginX = width * 0.1;
  final marginY = height * 0.1;
  for (var i = 0; i < count; i++) {
    line(
      random(marginX, width - marginX),
      random(marginY, height - marginY),
      random(marginX, width - marginX),
      random(marginY, height - marginY),
    );
  }
}
