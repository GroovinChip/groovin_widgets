import 'package:flutter/material.dart';

/// This widget represents a customizable 'handle' that you can add to your
/// modalBottomSheets
class ModalDrawerHandle extends StatelessWidget {
  /// Represents the MainAxisAlignment of the Row that contains the handle.
  /// The default value is MainAxisAlignment.center
  final MainAxisAlignment handleRowAlignment;

  /// Represents the height of the handle. The default value is 5.0
  final double handleHeight;

  /// Represents the height of the handle. The default value is 25.0
  final double handleWidth;

  /// Represents the color of the handle.
  /// The default value is #EEEEEE
  final Color handleColor;

  /// Represents the BorderRadius (rounding the corners of the handle).
  /// The default value is const BorderRadius.all(Radius.circular(10.0)).
  /// Note that when using a custom BorderRadius, you need to pass in
  /// a Radius, not a double.
  final BorderRadius handleBorderRadius;

  /// ModalDrawerHandle constructor.
  /// The widget is initialized with the default values.
  ModalDrawerHandle({
    this.handleRowAlignment = MainAxisAlignment.center,
    this.handleHeight = 5.0,
    this.handleWidth = 25.0,
    Color handleColor,
    this.handleBorderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
  }) : this.handleColor = handleColor ?? Colors.grey[300];

  // ModalDrawerHandle Widget builder
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: this.handleRowAlignment,
      children: <Widget>[
        Container(
          height: this.handleHeight,
          width: this.handleWidth,
          decoration: BoxDecoration(
            color: this.handleColor,
            borderRadius: this.handleBorderRadius,
          ),
        ),
      ],
    );
  }
}