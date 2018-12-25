import 'package:flutter/material.dart';

/// This class represents a DropdownButton that has an outline around it,
/// similar to the outline you can give a TextField. All of the properties
/// of a standard DropdownButton are available to the developer to customize.
/// Additionally, the InputDecoration that surrounds the DropdownMenu is available
/// to the developer to customize as desired.
class OutlineDropdownButtonFormField<T> extends StatefulWidget {
  // These properties correspond to the existing properties of a DropdownButton
  final Widget disabledHint;
  final int elevation;
  final Widget hint;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T> onChanged;
  final FormFieldValidator<T> validator;
  final FormFieldSetter<T> onSaved;
  final TextStyle style;
  final value;

  /// The widget is created with one default property: an outline border
  /// surrounding the DropdownButton
  OutlineDropdownButtonFormField({
    this.disabledHint,
    this.elevation = 8, // the default value per the source
    this.hint,
    this.iconSize = 24.0, // the default value per the source
    this.isDense = false, // the default value per the source
    this.isExpanded = true, // here I deviate from the source because this property is great
    @required this.items,
    this.onChanged,
    this.style,
    this.value,
    this.validator,
    this.onSaved,
  });

  @override
  _OutlineDropdownButtonFormFieldState<T> createState() => _OutlineDropdownButtonFormFieldState<T>();
}

class _OutlineDropdownButtonFormFieldState<T> extends State<OutlineDropdownButtonFormField<T>> {
  // OutlineDropdownButtonFormField widget builder
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<T>(
        onSaved: (val) => widget.onSaved,
        validator: widget.validator,
        builder: (FormFieldState<T> state) {
          return InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(8.0),
              errorText: state.hasError ? state.errorText : null,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                disabledHint: widget.disabledHint,
                elevation: widget.elevation,
                hint: widget.hint,
                iconSize: widget.iconSize,
                isDense: widget.isDense,
                isExpanded: widget.isExpanded,
                items: widget.items,
                style: widget.style,
                value: widget.value,
                onChanged: (T newValue) {
                  state.didChange(newValue);
                  widget.onChanged(newValue);
                },
              ),
            ),
          );
        },
      )
    );
  }
}