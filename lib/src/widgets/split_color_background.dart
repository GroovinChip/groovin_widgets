import 'package:flutter/material.dart';

/// {@template splitColorBackground}
/// A widget with header and body sections that each have different background colors.
///
/// Reminiscent of various designs seen on dribbble, uplabs, and other design
/// websites that show a header section with one background color, a body section
/// with a different background color, and rounded corners on the top of the
/// body section.
/// {@endtemplate}
class SplitColorBackground extends StatelessWidget {
  /// {@macro splitColorBackground}
  const SplitColorBackground({
    super.key,
    this.headerFlex = 1,
    required this.header,
    this.headerColor,
    this.bodyFlex = 4,
    required this.body,
    this.topLeftCornerRadius = 10,
    this.topRightCornerRadius = 10,
    this.bodyColor,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });

  /// The flex property of the [Flexible] containing the header widget.
  ///
  /// Defaults to `1`.
  final int headerFlex;

  /// The widget that will be used as the header
  final Widget header;

  /// The color for the header widget
  final Color? headerColor;

  /// The flex property of the [Flexible] containing the body widget.
  ///
  /// Defaults to `4`.
  final int bodyFlex;

  /// The widget that will be used as the body
  final Widget body;

  /// The radius for the top left corner of the body.
  ///
  /// Defaults to `10`.
  final double topLeftCornerRadius;

  /// The radius for the top right corner of the body.
  ///
  /// Defaults to `10`.
  final double topRightCornerRadius;

  /// The color for the body widget
  final Color? bodyColor;

  /// An optional [AppBar]
  final AppBar? appBar;

  /// An optional [FloatingActionButton]
  final FloatingActionButton? floatingActionButton;

  /// An optional [FloatingActionButtonLocation]
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// An optional [BottomNavigationBar]
  final BottomNavigationBar? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: headerColor,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: headerFlex,
            child: header,
          ),
          Flexible(
            flex: bodyFlex,
            child: Material(
              color: bodyColor,
              elevation: 0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftCornerRadius),
                topRight: Radius.circular(topRightCornerRadius),
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
