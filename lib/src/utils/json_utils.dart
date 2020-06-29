import 'dart:convert';

/// Prints a JSON String in a nicely formatted manner.
void printFormattedJson(Object json) {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');
  String prettyJson = encoder.convert(json);
  print(prettyJson);
}
