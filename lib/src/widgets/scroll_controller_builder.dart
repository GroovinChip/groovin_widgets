import 'package:flutter/material.dart';

/// {@template scrollControllerBuilder}
/// A widget that exposes a ScrollController to the child, thereby allowing
/// widgets that require a ScrollController to be fully declarative.
/// {@endtemplate}
class ScrollControllerBuilder extends StatefulWidget {
  /// {@macro scrollControllerBuilder}
  const ScrollControllerBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, ScrollController controller)
      builder;

  @override
  State<ScrollControllerBuilder> createState() =>
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
