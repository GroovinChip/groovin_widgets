import 'package:flutter/material.dart';

/// A customizable 'handle' intended for use with modal [BottomSheet] widgets.
class ModalDrawerHandle extends StatelessWidget {
  ModalDrawerHandle({
    this.handleRowAlignment = MainAxisAlignment.center,
    this.handleHeight = 5.0,
    this.handleWidth = 25.0,
    Color? handleColor,
    this.handleBorderRadius = const BorderRadius.all(
      Radius.circular(10.0),
    ),
  }) : this.handleColor = handleColor ?? Colors.grey[300];

  /// The MainAxisAlignment of the Row that contains the handle.
  ///
  /// Defaults to [MainAxisAlignment.center]
  final MainAxisAlignment handleRowAlignment;

  /// The height of the handle. Defaults to `5.0`.
  final double handleHeight;

  /// The height of the handle.
  ///
  /// Defaults to `25.0`
  final double handleWidth;

  /// The color of the handle.
  ///
  /// Defaults to `#EEEEEE`
  final Color? handleColor;

  /// The [BorderRadius] of the handle.
  ///
  /// Best used for rounding the corners of the handle. Defaults to
  /// `const BorderRadius.all(Radius.circular(10.0))`. Note that when using a
  /// custom [BorderRadius], you need to pass in a [Radius], not a double.
  final BorderRadius handleBorderRadius;

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
