import 'dart:convert';

import 'package:flutter/widgets.dart';

/// Prints a JSON String in a nicely formatted manner.
void printFormattedJson(Object json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String formattedJson = encoder.convert(json);
  debugPrint(formattedJson);
}
