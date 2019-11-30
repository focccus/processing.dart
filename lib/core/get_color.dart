import 'dart:ui';

getColor(dynamic r, int g, int b, int o) {
  if (r is Color) return r;

  if (r is String) {
    int i = int.tryParse(r.replaceFirst("#", "FF"), radix: 16);
    if (i != null) return Color(i);
  }

  if (r is int) {
    if (g != null && b != null) {
      return Color.fromRGBO(r, g, b, o != null ? o / 255 : 1);
    }
    return Color.fromRGBO(r, r, r, 1);
  }

  return Color(0xffffffff);
}
