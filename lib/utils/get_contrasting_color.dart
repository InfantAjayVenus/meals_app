import 'package:flutter/material.dart';

Color getContrastingColor(Color color, {double luminanceThreshold = 0.5}) {
  // Calculate the luminance of the given color
  double luminance = color.computeLuminance();

  // Return a contrasting color based on the luminance
  return luminance > luminanceThreshold ? Colors.black : Colors.white;
}
