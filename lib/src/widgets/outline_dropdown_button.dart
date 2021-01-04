import 'package:flutter/material.dart';

/// A [DropdownButton] with a default outlined [InputDecoration].
///
/// All of the properties of a standard [DropdownButton] are available for
/// customization.
///
/// [isExpanded] defaults to true, unlike the source.
class OutlineDropdownButton extends StatefulWidget {
  OutlineDropdownButton({
    this.inputDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(8.0),
    ),
    this.disabledHint,
    this.elevation = 8,
    this.hint,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = true,
    this.items,
    this.onChanged,
    this.style,
    this.value,
  });

  /// The InputDecoration that can be customized by the user.
  ///
  /// Defaults to:
  /// ```dart
  /// const InputDecoration(
  ///   border: OutlineInputBorder(),
  ///     contentPadding: EdgeInsets.all(8.0),
  /// ),
  /// ```
  final InputDecoration inputDecoration;

  final Widget disabledHint;
  final int elevation;
  final Widget hint;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final List<DropdownMenuItem> items;
  final ValueChanged onChanged;
  final TextStyle style;
  final value;

  @override
  _OutlineDropdownButtonState createState() => _OutlineDropdownButtonState();
}

class _OutlineDropdownButtonState extends State<OutlineDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: widget.inputDecoration,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            disabledHint: widget.disabledHint,
            elevation: widget.elevation,
            hint: widget.hint,
            iconSize: widget.iconSize,
            isDense: widget.isDense,
            isExpanded: widget.isExpanded,
            items: widget.items,
            onChanged: widget.onChanged,
            style: widget.style,
            value: widget.value,
          ),
        ),
      ),
    );
  }
}
