import 'package:flutter/material.dart';

/// This class represents a DropdownButton that has an outline around it,
/// similar to the outline you can give a TextField. All of the properties
/// of a standard DropdownButton are available to the developer to customize.
/// Additionally, the InputDecoration that surrounds the DropdownMenu is available
/// to the developer to customize as desired.
class OutlineDropdownButton extends StatefulWidget {
  /// Represents the InputDecoration that can be customized by the user
  final InputDecoration inputDecoration;

  // These properties correspond to the existing properties of a DropdownButton
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

  /// The widget is created with four default property: an outline border
  /// surrounding the DropdownButton, and three properties that correspond
  /// to the default properties in the original widget
  OutlineDropdownButton({
    this.inputDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(8.0),
    ),
    this.disabledHint,
    this.elevation = 8, // the default value per the source
    this.hint,
    this.iconSize = 24.0, // the default value per the source
    this.isDense = false, // the default value per the source
    this.isExpanded = true, // here I deviate from the source because this property is great
    this.items,
    this.onChanged,
    this.style,
    this.value,
  });

  @override
  _OutlineDropdownButtonState createState() => _OutlineDropdownButtonState();
}

class _OutlineDropdownButtonState extends State<OutlineDropdownButton> {

  // OutlineDropdownButton widget builder
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