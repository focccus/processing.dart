import 'package:processing.dart/processing.dart';

/// Inspired by 34 Dots 6 Lines - SKYE SCHUCHMAN
/// https://www.artfullywalls.com/works/6904/34-dots-6-lines
void dotsAndLines() {
  final total = 20;
  final margin = width * 0.05;

  fill(0);
  stroke(0);

  for (var i = 0; i < total; i++) {
    var x = random(margin, width - margin);
    var y = random(margin, height - margin);
    circle(
      x,
      y,
      random(3, 10),
    );
    if (random() > 0.8) {
      var d = width;
      while (x + d > width - margin ||
          x + d < margin ||
          y + d > width - margin ||
          y + d < margin ||
          d.abs() < width / 20) {
        d = random(-width / 3, width / 3);
      }

      if (random(true)) {
        line(x, y, x + d, y);
        circle(
          x + d,
          y,
          random(3, 10),
        );
      } else {
        line(x, y, x, y + d);
        circle(
          x,
          y + d,
          random(3, 10),
        );
      }
    }
  }
}
