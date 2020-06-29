import 'package:flutter/material.dart';

/// Constructs a Color widget from a hex code string, of the format #RRGGBB.
/// Useful in circumstances where you might get a color value from an API
/// in the hex format and you want to create a Color object that uses that value.
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

/// A helper function for determining the color of a Text based on a given
/// background color. Useful for ensuring that Text is readable on certain colors.
///
/// This is most useful when the given backgroundColor is unknown. For example,
/// the GitHub API provides colors for programming languages, and you can have
/// an Array of languages. If you want to construct widgets to represent the
/// languages and have the text color be readable, this function is super helpful.
Color textLuminance(Color backgroundColor) {
  return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
