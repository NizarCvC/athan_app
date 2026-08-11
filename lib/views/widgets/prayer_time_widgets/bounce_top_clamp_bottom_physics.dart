import 'package:flutter/material.dart';

class BounceTopClampBottomPhysics extends BouncingScrollPhysics {
  const BounceTopClampBottomPhysics({super.parent});

  @override
  BounceTopClampBottomPhysics applyTo(ScrollPhysics? ancestor) {
    return BounceTopClampBottomPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      return value - position.maxScrollExtent;
    }
    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      return value - position.maxScrollExtent;
    }
    return 0.0;
  }
}
