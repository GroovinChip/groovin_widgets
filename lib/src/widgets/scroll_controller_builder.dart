import 'package:flutter/material.dart';

/// A widget that exposes a ScrollController to the child, thereby allowing 
/// widgets that require a ScrollController to be fully declarative.
class ScrollControllerBuilder extends StatefulWidget {
  const ScrollControllerBuilder({
    required this.builder,
  });

  final Widget Function(BuildContext context, ScrollController controller)
      builder;

  @override
  _ScrollControllerBuilderState createState() =>
      _ScrollControllerBuilderState();
}

class _ScrollControllerBuilderState extends State<ScrollControllerBuilder> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, scrollController);
  }
}
