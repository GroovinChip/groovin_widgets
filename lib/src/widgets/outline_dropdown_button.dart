import 'package:flutter/material.dart';

/// {@template outlineDropdownButton}
/// A [DropdownButton] with a default outlined [InputDecoration].
///
/// All of the properties of a standard [DropdownButton] are available for
/// customization.
///
/// [isExpanded] defaults to true, unlike the source.
/// {@endtemplate}
class OutlineDropdownButton<T> extends StatefulWidget {
  /// {@macro outlineDropdownButton}
  const OutlineDropdownButton({
    super.key,
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
    required this.value,
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

  final Widget? disabledHint;
  final int elevation;
  final Widget? hint;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged? onChanged;
  final TextStyle? style;
  final T value;

  @override
  State<OutlineDropdownButton> createState() =>
      _OutlineDropdownButtonState<T>();
}

class _OutlineDropdownButtonState<T> extends State<OutlineDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: widget.inputDecoration,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
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
    );
  }
}
