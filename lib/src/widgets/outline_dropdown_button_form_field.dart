import 'package:flutter/material.dart';

/// {@template outlineDropdownButtonFormField}
/// A [DropdownButton] with a default outlined [InputDecoration] that can be
/// used in [Form] widgets.
///
/// The [value] of this widget can be validated just like [TextFormField] can.
///
/// All of the properties of a standard [DropdownButton] are available for
/// customization.
///
/// [isExpanded] defaults to true, unlike the source.
/// {@endtemplate}
class OutlineDropdownButtonFormField<T> extends StatefulWidget {
  /// {@macro outlineDropdownButtonFormField}
  const OutlineDropdownButtonFormField({
    super.key,
    this.disabledHint,
    this.elevation = 8,
    this.hint,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = true,
    @required this.items,
    this.onChanged,
    this.style,
    required this.value,
    this.validator,
    this.onSaved,
    this.decoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(8.0),
    ),
  });

  // These properties correspond to the existing properties of a DropdownButton
  final Widget? disabledHint;
  final int elevation;
  final Widget? hint;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final TextStyle? style;
  final T value;
  final InputDecoration decoration;

  // These properties are unique to this widget
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final FormFieldSetter<T>? onSaved;

  @override
  State<OutlineDropdownButtonFormField<T>> createState() =>
      _OutlineDropdownButtonFormFieldState<T>();
}

class _OutlineDropdownButtonFormFieldState<T>
    extends State<OutlineDropdownButtonFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: widget.value,
      onSaved: (val) => widget.onSaved,
      validator: widget.validator,
      builder: (FormFieldState<T> state) {
        final decoration = widget.decoration
            .copyWith(errorText: state.hasError ? state.errorText : null);
        return InputDecorator(
          decoration: decoration,
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
              onChanged: (T? newValue) {
                state.didChange(newValue);
                widget.onChanged!(newValue);
              },
            ),
          ),
        );
      },
    );
  }
}
