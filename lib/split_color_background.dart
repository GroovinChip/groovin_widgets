import 'package:flutter/material.dart';

/// This widget enables the replication of designs seen on dribbble, uplabs, and other
/// design websites that show a header section with one background color, a body section with
/// a different background color, and rounded corners on the top of the body section.
///
/// This widget operates as a Scaffold who's body is a Column with two Flexible widgets to represent
/// the header and the body. Various Scaffold properties are exposed to the developer.
class SplitColorBackground extends StatelessWidget {
  /// Represents the flex property of the Flexible containing the header widget. Defaults to 1.
  final int headerFlex;
  /// Represents the Widget that will be used as the header
  final Widget header;
  /// Represents the color for the header widget
  final Color headerColor;
  /// Represents the flex property of the Flexible containing the body widget. Defaults to 4.
  final int bodyFlex;
  /// Represents the Widget that will be used as the body
  final Widget body;
  /// Represents the corner radius for the top left corner of the body
  final double topLeftCornerRadius;
  /// Represents the corner radius for the top right corner of the body
  final double topRightCornerRadius;
  /// Represents the color for the body widget
  final Color bodyColor;
  /// The Scaffold appBar is available for optional use.
  final AppBar appBar;
  /// The Scaffold FloatingActionButton is available for optional use.
  final FloatingActionButton floatingActionButton;
  /// The Scaffold FloatingActionButtonLocation is available for optional use.
  final FloatingActionButtonLocation floatingActionButtonLocation;
  /// The Scaffold BottomNavigationBar is available for optional use.
  final BottomNavigationBar bottomNavigationBar;

  const SplitColorBackground({
    Key key,
    this.headerFlex = 1,
    @required this.header,
    this.headerColor,
    this.bodyFlex = 4,
    @required this.body,
    this.topLeftCornerRadius = 10,
    this.topRightCornerRadius = 10,
    this.bodyColor,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  }) : super(key: key);

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
