import 'package:flutter/material.dart';

/// Constructs a [Color] from a hex code string, of the format #RRGGBB.
///
/// Useful in circumstances where you might get a color value from an API call
/// in the hex format and you want to use a [Color] with that value.
class HexColor extends Color {
  HexColor(
    final String hexColor,
  ) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

/// A helper function for determining what color to use in a [Text] widget
/// based on a given background color.
///
/// Useful for ensuring that text is readable on a given background color.
///
/// This is most useful when the given background color is unknown. For example,
/// the GitHub API provides colors for programming languages, and you can have
/// an Array of languages. If you want to construct widgets to represent the
/// languages and have the text color be readable, this function is quite helpful.
Color textLuminance(Color backgroundColor) {
  return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
