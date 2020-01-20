import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../processing.dart';
import '../core/actions.dart';

Canvas getCanvas([PictureRecorder recorder]) {
  recorder ??= PictureRecorder();
  return Canvas(recorder, Rect.fromLTWH(0, 0, width, height));
}

Picture getPicture() {
  final recorder = PictureRecorder();
  final canvas = getCanvas(recorder);
  if (c_actions.actions != null)
    c_actions.actions.forEach((CanvasAction a) {
      a.draw(canvas);
    });
  return recorder.endRecording();
}

Future<Image> getImage([int newW, int newH]) async {
  double oldW = width;
  double oldH = height;
  if (newW != null && newH != null) {
    c_actions.canvas = Size(newW.toDouble(), newH.toDouble());
  }
  final Image img = await getPicture().toImage(width.round(), height.round());

  c_actions.canvas = Size(oldW, oldH);

  return img;
}

Future<ByteData> getImageBytes([
  ImageByteFormat format,
  int newW,
  int newH,
]) async =>
    (await getImage()).toByteData(format: format ?? ImageByteFormat.png);

Future<File> saveCanvas([
  String path,
  int newW,
  int newH,
]) async {
  if (path == null) {
    path = (await getApplicationDocumentsDirectory()).path +
        "/${DateTime.now().millisecondsSinceEpoch}.png";
    print(path);
  }
  final ByteData data = await getImageBytes(ImageByteFormat.png, newW, newH);
  final file = File.fromUri(Uri.file(path));
  try {
    return await file.writeAsBytes(Uint8List.view(data.buffer));
  } catch (e) {
    print(e);
    return null;
  }
}
