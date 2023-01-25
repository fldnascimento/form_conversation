import 'package:flutter/material.dart';

abstract class ColorsUtil {
  static String hexFromArgb(double a, double r, double g, double b) {
    return '${a.round().toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${r.round().toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${g.round().toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${b.round().toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  static int intFromHex(String hex) {
    return int.tryParse(hex, radix: 16) ?? 0;
  }

  static Color mixColors(Color argb1, Color argb2, double amount) {
    final p = amount / 100;

    final a = (argb2.alpha - argb1.alpha) * p + argb1.alpha;
    final r = (argb2.red - argb1.red) * p + argb1.red;
    final g = (argb2.green - argb1.green) * p + argb1.green;
    final b = (argb2.blue - argb1.blue) * p + argb1.blue;

    final hex = hexFromArgb(a, r, g, b);
    return Color(intFromHex(hex));
  }

  static Color multiply(Color argb1, Color argb2) {
    final a = argb1.alpha.toDouble();
    final r = argb1.red * argb2.red / 255;
    final g = argb1.green * argb2.green / 255;
    final b = argb1.blue * argb2.blue / 255;

    final hex = hexFromArgb(a, r, g, b);
    return Color(intFromHex(hex));
  }

  static Map<int, Color> shades(Color colorBase) {
    const baseLight = Color(0xFFFFFFFF);
    final baseDark = multiply(colorBase, colorBase);

    return <int, Color>{
      50: mixColors(baseLight, colorBase, 12),
      100: mixColors(baseLight, colorBase, 30),
      200: mixColors(baseLight, colorBase, 50),
      300: mixColors(baseLight, colorBase, 70),
      400: mixColors(baseLight, colorBase, 85),
      500: colorBase,
      600: mixColors(baseDark, colorBase, 87),
      700: mixColors(baseDark, colorBase, 70),
      800: mixColors(baseDark, colorBase, 54),
      900: mixColors(baseDark, colorBase, 25),
    };
  }
}

extension ColorExtension on Color {
  Map<int, Color> get shades {
    return ColorsUtil.shades(this);
  }

  Color get shade50 => shades[50]!;
  Color get shade100 => shades[100]!;
  Color get shade200 => shades[200]!;
  Color get shade300 => shades[300]!;
  Color get shade400 => shades[400]!;
  Color get shade500 => shades[500]!;
  Color get shade600 => shades[600]!;
  Color get shade700 => shades[700]!;
  Color get shade800 => shades[800]!;
  Color get shade900 => shades[900]!;
}
